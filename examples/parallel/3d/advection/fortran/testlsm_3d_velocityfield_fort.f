c***********************************************************************
c
c  File:        testlsm_3d_velocityfield.f
c  Copyright:   (c) 2005-2006 Kevin T. Chu
c  Revision:    $Revision: 1.3 $
c  Modified:    $Date: 2006/02/11 04:15:35 $
c  Description: F77 velocity field routines for 3d LSM test problem
c
c***********************************************************************
c***********************************************************************
c  Uniform velocity in x-direction with magnitude 1:  U = (1,0,0)
c***********************************************************************
      subroutine uniformvelx(
     &  u,v,w,
     &  ilo_gb, ihi_gb, jlo_gb, jhi_gb, klo_gb, khi_gb,
     &  ilo_fb, ihi_fb, jlo_fb, jhi_fb, klo_fb, khi_fb)
c***********************************************************************
      implicit none

      integer ilo_gb, ihi_gb, jlo_gb, jhi_gb, klo_gb, khi_gb
      integer ilo_fb, ihi_fb, jlo_fb, jhi_fb, klo_fb, khi_fb
      double precision u(ilo_gb:ihi_gb,
     &                   jlo_gb:jhi_gb,
     &                   klo_gb:khi_gb)
      double precision v(ilo_gb:ihi_gb,
     &                   jlo_gb:jhi_gb,
     &                   klo_gb:khi_gb)
      double precision w(ilo_gb:ihi_gb,
     &                   jlo_gb:jhi_gb,
     &                   klo_gb:khi_gb)
      integer i,j,k
      double precision zero,one
      parameter (zero=0.0)
      parameter (one=1.0)

c     loop over box {
      do k=klo_fb,khi_fb
        do j=jlo_fb,jhi_fb
          do i=ilo_fb,ihi_fb
  
            u(i,j,k) = one
            v(i,j,k) = zero
            w(i,j,k) = zero

          enddo
        enddo
      enddo
c     } end loop over box

      return
      end
c***********************************************************************
c***********************************************************************
c  Uniform velocity in y-direction with magnitude 1:  U = (0,1,0)
c***********************************************************************
      subroutine uniformvely(
     &  u,v,w,
     &  ilo_gb, ihi_gb, jlo_gb, jhi_gb, klo_gb, khi_gb,
     &  ilo_fb, ihi_fb, jlo_fb, jhi_fb, klo_fb, khi_fb)
c***********************************************************************
      implicit none

      integer ilo_gb, ihi_gb, jlo_gb, jhi_gb, klo_gb, khi_gb
      integer ilo_fb, ihi_fb, jlo_fb, jhi_fb, klo_fb, khi_fb
      double precision u(ilo_gb:ihi_gb,
     &                   jlo_gb:jhi_gb,
     &                   klo_gb:khi_gb)
      double precision v(ilo_gb:ihi_gb,
     &                   jlo_gb:jhi_gb,
     &                   klo_gb:khi_gb)
      double precision w(ilo_gb:ihi_gb,
     &                   jlo_gb:jhi_gb,
     &                   klo_gb:khi_gb)
      integer i,j,k
      double precision zero,one
      parameter (zero=0.0)
      parameter (one=1.0)

c     loop over box {
      do k=klo_fb,khi_fb
        do j=jlo_fb,jhi_fb
          do i=ilo_fb,ihi_fb
  
            u(i,j,k) = zero
            v(i,j,k) = one
            w(i,j,k) = zero

          enddo
        enddo
      enddo
c     } end loop over box

      return
      end
c***********************************************************************
c***********************************************************************
c  Uniform velocity in (1,1,0)-direction with magnitude sqrt(2):  
c    U = (1,1,0)
c***********************************************************************
      subroutine uniformvelxy(
     &  u,v,w,
     &  ilo_gb, ihi_gb, jlo_gb, jhi_gb, klo_gb, khi_gb,
     &  ilo_fb, ihi_fb, jlo_fb, jhi_fb, klo_fb, khi_fb)
c***********************************************************************
      implicit none

      integer ilo_gb, ihi_gb, jlo_gb, jhi_gb, klo_gb, khi_gb
      integer ilo_fb, ihi_fb, jlo_fb, jhi_fb, klo_fb, khi_fb
      double precision u(ilo_gb:ihi_gb,
     &                   jlo_gb:jhi_gb,
     &                   klo_gb:khi_gb)
      double precision v(ilo_gb:ihi_gb,
     &                   jlo_gb:jhi_gb,
     &                   klo_gb:khi_gb)
      double precision w(ilo_gb:ihi_gb,
     &                   jlo_gb:jhi_gb,
     &                   klo_gb:khi_gb)
      integer i,j,k
      double precision one
      parameter (one=1.0)

c     loop over box {
      do k=klo_fb,khi_fb
        do j=jlo_fb,jhi_fb
          do i=ilo_fb,ihi_fb
  
            u(i,j,k) = one
            v(i,j,k) = one
            w(i,j,k) = 0.0

          enddo
        enddo
      enddo
c     } end loop over box

      return
      end
c***********************************************************************
c***********************************************************************
c Pure rotation velocity field with angular velocity 1: 
c   U = (-y,x,0)
c***********************************************************************
      subroutine rotatingvel(
     &  u,v,w,
     &  ilo_gb, ihi_gb, jlo_gb, jhi_gb, klo_gb, khi_gb,
     &  ilo_fb, ihi_fb, jlo_fb, jhi_fb, klo_fb, khi_fb,
     &  dx,
     &  x_lower)
c***********************************************************************
      implicit none

      integer ilo_gb, ihi_gb, jlo_gb, jhi_gb, klo_gb, khi_gb
      integer ilo_fb, ihi_fb, jlo_fb, jhi_fb, klo_fb, khi_fb
      double precision u(ilo_gb:ihi_gb,
     &                   jlo_gb:jhi_gb,
     &                   klo_gb:khi_gb)
      double precision v(ilo_gb:ihi_gb,
     &                   jlo_gb:jhi_gb,
     &                   klo_gb:khi_gb)
      double precision w(ilo_gb:ihi_gb,
     &                   jlo_gb:jhi_gb,
     &                   klo_gb:khi_gb)
      integer i,j,k
      double precision dx(0:2)
      double precision x_lower(0:2)
      double precision x,y,z

c     loop over box {
      do k=klo_fb,khi_fb
        do j=jlo_fb,jhi_fb
          do i=ilo_fb,ihi_fb
 
            x = x_lower(0) + dx(0)*(0.5+i-ilo_gb)
            y = x_lower(1) + dx(1)*(0.5+j-jlo_gb)
            z = x_lower(2) + dx(2)*(0.5+k-klo_gb)
            u(i,j,k) = -y
            v(i,j,k) = x
            w(i,j,k) = 0.0

          enddo
        enddo
      enddo
c     } end loop over box

      return
      end
c***********************************************************************
c***********************************************************************
c Pure expansion/compression velocity field oscillating in time:
c   U = speed*cos(omega*t)
c***********************************************************************
      subroutine expandingvel(
     &  u,v,w,
     &  ilo_gb, ihi_gb, jlo_gb, jhi_gb, klo_gb, khi_gb,
     &  ilo_fb, ihi_fb, jlo_fb, jhi_fb, klo_fb, khi_fb,
     &  dx,
     &  x_lower,
     &  speed,
     &  omega,
     &  time)
c***********************************************************************
      implicit none

      integer ilo_gb, ihi_gb, jlo_gb, jhi_gb, klo_gb, khi_gb
      integer ilo_fb, ihi_fb, jlo_fb, jhi_fb, klo_fb, khi_fb
      double precision u(ilo_gb:ihi_gb,
     &                   jlo_gb:jhi_gb,
     &                   klo_gb:khi_gb)
      double precision v(ilo_gb:ihi_gb,
     &                   jlo_gb:jhi_gb,
     &                   klo_gb:khi_gb)
      double precision w(ilo_gb:ihi_gb,
     &                   jlo_gb:jhi_gb,
     &                   klo_gb:khi_gb)
      integer i,j,k
      double precision dx(0:2)
      double precision x_lower(0:2)
      double precision time
      double precision speed
      double precision omega
      double precision x,y,z
      double precision r

c     loop over box {
      do k=klo_fb,khi_fb
        do j=jlo_fb,jhi_fb
          do i=ilo_fb,ihi_fb
 
            x = x_lower(0) + dx(0)*(0.5+i-ilo_fb)
            y = x_lower(1) + dx(1)*(0.5+j-jlo_fb)
            z = x_lower(2) + dx(2)*(0.5+k-klo_fb)
            r = sqrt(x**2 + y**2 + z**2)
            if (r .ne. 0) then
              u(i,j,k) = speed*cos(omega*time)*x/r
              v(i,j,k) = speed*cos(omega*time)*y/r
              w(i,j,k) = speed*cos(omega*time)*z/r
            else
              u(i,j,k) = 0.0
              v(i,j,k) = 0.0
              w(i,j,k) = 0.0
            endif

          enddo
        enddo
      enddo
c     } end loop over box

      return
      end
c***********************************************************************