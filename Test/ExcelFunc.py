
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
