from win32com.client import Dispatch
import xml.etree.ElementTree as ET


class CIBC_PUC(object):

    def __init__(self, myexcel):
        self.xl = Dispatch("Excel.Application")
        self.sheet = myexcel
        #self.myBrands = brands

    def amIproperStatment(self, row, column):
        if sheet.Cells(row, column).Value != None:
            return True
        else:
            return False
    #================ Geting Rows
    def findHowManyRows(self):
        emptyrows = 0
        myrow = 1
        while True:
            myrow = myrow + 1
            emptyrows = emptyrows + 1

            if self.amIproperStatment(myrow, 1):
                emptyrows = 0

            #amIproperStatment(row = myrow, column = 1)
            if myrow > 100 or emptyrows >= 5:
                break

        return myrow - emptyrows




# Get the list of Banks
tree = ET.parse('C:\\Users\\Daniel.Mladenov\\Desktop\\FRANCE\\PUC\\XML.xml')
root = tree.getroot()

myBrands = []

for banks in root.iter('value'):
    for label in banks.iter('text'):
        myBrands.append(label.text)

print(myBrands)



# Excel
xl = Dispatch("Excel.Application")
xl.Visible = True

wb = xl.Workbooks.Open(r"C:\Users\Daniel.Mladenov\Desktop\FRANCE\PUC\19-081714-01_DP_CIBC_F2020_PUC_Benchmarking_Q1 F20_Percent_v2_080520_C.xlsx")

for sheet in wb.Worksheets:
    #print(sheet.name)
    excel = wb.Worksheets[sheet.name]
    test = CIBC_PUC(excel)

    tt = test.amIproperStatment(2,1)
    endrow = test.findHowManyRows()
    print(endrow)
    #print(tt)


wb.Close()
xl.Quit()
