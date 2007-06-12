/*
 * File:        lsm_samrai_f77_utilities.h
 * Copyright:   (c) 2005-2006 Kevin T. Chu
 * Revision:    $Revision: 1.3 $
 * Modified:    $Date: 2006/02/09 16:43:04 $
 * Description: Header file for Fortran 77 3D ENO/WENO routines.
 */

#ifndef INCLUDED_LSM_SAMRAI_F77_UTILITIES
#define INCLUDED_LSM_SAMRAI_F77_UTILITIES

/* Link between C/C++ and Fortran function names
 *
 *      name in                            name in
 *      C/C++ code                         Fortran code
 *      ----------                         ------------
 */
#define LSM1D_SAMRAI_UTILITIES_COPY_DATA   lsm1dsamraiutilitiescopydata_
#define LSM2D_SAMRAI_UTILITIES_COPY_DATA   lsm2dsamraiutilitiescopydata_
#define LSM3D_SAMRAI_UTILITIES_COPY_DATA   lsm3dsamraiutilitiescopydata_

void LSM1D_SAMRAI_UTILITIES_COPY_DATA(
  double *dst_data,
  const int *ilo_dst_gb,
  const int *ihi_dst_gb,
  double *src_data,
  const int *ilo_src_gb,
  const int *ihi_src_gb,
  const int *ilo_fb,
  const int *ihi_fb);

void LSM2D_SAMRAI_UTILITIES_COPY_DATA(
  double *dst_data,
  const int *ilo_dst_gb,
  const int *ihi_dst_gb,
  const int *jlo_dst_gb,
  const int *jhi_dst_gb,
  double *src_data,
  const int *ilo_src_gb,
  const int *ihi_src_gb,
  const int *jlo_src_gb,
  const int *jhi_src_gb,
  const int *ilo_fb,
  const int *ihi_fb,
  const int *jlo_fb,
  const int *jhi_fb);

void LSM3D_SAMRAI_UTILITIES_COPY_DATA(
  double *dst_data,
  const int *ilo_dst_gb,
  const int *ihi_dst_gb,
  const int *jlo_dst_gb,
  const int *jhi_dst_gb,
  const int *klo_dst_gb,
  const int *khi_dst_gb,
  double *src_data,
  const int *ilo_src_gb,
  const int *ihi_src_gb,
  const int *jlo_src_gb,
  const int *jhi_src_gb,
  const int *klo_src_gb,
  const int *khi_src_gb,
  const int *ilo_fb,
  const int *ihi_fb,
  const int *jlo_fb,
  const int *jhi_fb,
  const int *klo_fb,
  const int *khi_fb);

#endif