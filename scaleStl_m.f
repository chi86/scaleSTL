      program scaleStl_m
      ! chi
      ! 
      
      implicit none

      CHARACTER(len=100) :: arg

      character(100) :: string

      character(100) :: Header
      character(14) :: Facet1,Facet2
      real,dimension(3) :: vector
      character(14) :: Loop
      character(12) :: vertex
      character(12) :: v1,v2,v3,v4

      character(100) :: name,path,Oname
      character(200) :: ende
      
      integer i

      real :: scaling

      CALL getarg(1, arg)


c$$$ 1100 format(2x,A5,1x,A6,3(1x,eS12.6e2))
c$$$ 1101 format(2x,A5,1x,A6,1x,eS13.6e2,1x,eS12.6e2,1x,eS12.6e2)
c$$$ 1102 format(2x,A5,1x,A6,1x,eS12.6e2,1x,eS13.6e2,1x,eS12.6e2)
c$$$ 1103 format(2x,A5,1x,A6,1x,eS12.6e2,1x,eS12.6e2,1x,eS13.6e2)
 1105 format(2x,A5,1x,A6,3(1x,eS13.6e2))

c$$$ 1110 format(6x,A6,3(1x,eS12.6e2))
c$$$ 1111 format(6x,A6,1x,eS13.6e2,1x,eS13.6e2,1x,eS12.6e2)
c$$$ 1112 format(6x,A6,1x,eS12.6e2,1x,eS13.6e2,1x,eS12.6e2)
c$$$ 1113 format(6x,A6,1x,eS12.6e2,1x,eS13.6e2,1x,eS13.6e2)
 1115 format(6x,A6,3(1x,eS13.6e2))


      write(*,*)'Scale a STL File (ascii-format):'
      write(*,*)'--------------------------------'
      write(*,*)
      write(*,*)'INPUT  : ',arg
      write(*,*)'OUTPUT : ','M'//arg

c$$$      write(*,'(A)',advance='no')'File (*.stl)                : '
c$$$      read(*,*)path
c$$$      write(*,'(A)',advance='no')'Output - File (solid ***)   : '
c$$$      read(*,*)Oname
c$$$
c$$$      write(*,'(A)',advance='no')'Scale-factor (mm->m = 1000) : '
c$$$      !scaling = 1000
c$$$      read(*,*)scaling
      scaling=1000.

      !open(unit=7,file="stl_test.stl",status='old')
      open(unit=7,file=arg,status='old')
      open(unit=8,file='M'//arg)



      !Header
      read(7,'(A,1x,A)')Header
      write(8,'(A)')TRIM(Header)

      i = 0
 55   continue
      read(7,'(A100)')string
      if(string(1:4).eq."ends") goto 56
      i = mod(i,7)+1

      SELECT CASE (i)
         CASE (1)
         ! Face Normal
            read(string,*)Facet1,Facet2,vector(1),vector(2),vector(3)
            write(8,1105)Facet1,Facet2,
     &           vector(1)/scaling,
     &           vector(2)/scaling,
     &           vector(3)/scaling
            goto 55

         CASE (2)
         ! outer loop
            read(string,'(A14)')Loop
            write(8,'(A14)')Loop
            goto 55

         CASE (3)
         ! vertex
            read(string,*)vertex,vector(1),vector(2),vector(3)
            write(8,1115)vertex,
     &           vector(1)/scaling,
     &           vector(2)/scaling,
     &           vector(3)/scaling
            goto 55

         CASE (4)
            read(string,*)vertex,vector(1),vector(2),vector(3)
            write(8,1115)vertex,
     &           vector(1)/scaling,
     &           vector(2)/scaling,
     &           vector(3)/scaling
            goto 55

         CASE (5)
            read(string,*)vertex,vector(1),vector(2),vector(3)
            write(8,1115)vertex,
     &           vector(1)/scaling,
     &           vector(2)/scaling,
     &           vector(3)/scaling
            goto 55
      
         CASE (6)
         ! end loop
            read(string,'(A11)')Loop
            write(8,'(A11)')Loop
            goto 55
      
         CASE (7)
         ! endfacet
            read(string,'(A10)')Loop
            write(8,'(A10)')Loop
            goto 55

         END SELECT

      
 56   continue
      write(8,'(A)')TRIM(string)

      close(7)
      close(8)

      write(*,*)' DONE .........'

      end
