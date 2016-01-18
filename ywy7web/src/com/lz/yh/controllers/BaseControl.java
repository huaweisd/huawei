package com.lz.yh.controllers;

import org.springframework.beans.factory.annotation.Autowired;

import com.lz.yh.services.tconfig.serivce.TConfigService;
import com.lz.yh.services.tevaluation.service.TEvaluationService;
import com.lz.yh.services.tfriendlink.serivce.TFriendLinkService;
import com.lz.yh.services.timages.serivce.TImagesService;
import com.lz.yh.services.tnews.serivce.TNewsService;
import com.lz.yh.services.tpackage.serivce.TPackageService;
import com.lz.yh.services.tproductopen.serivce.TProductOpenService;
import com.lz.yh.services.tproductos.serivce.TProductOsService;
import com.lz.yh.services.tproducts.serivce.TProductsService;
import com.lz.yh.services.tproducttest.serivce.TProductTestService;
import com.lz.yh.services.tproductzq.serivce.TProductZQService;
import com.lz.yh.services.traiders.serivce.TRaidersService;
import com.lz.yh.services.tuser.serivce.TUserService;
import com.lz.yh.services.tvideos.serivce.TVideosService;

public class BaseControl {
	@Autowired
	public TImagesService tImagesService;
	@Autowired
	public TRaidersService tRaidersService;
	@Autowired
	public TEvaluationService tEvaluationService;
	@Autowired
	public TNewsService tNewsService;
	@Autowired
	public TConfigService tConfigService;
	@Autowired
	public TProductZQService tProductZQService;
	@Autowired
	public TProductTestService tProductTestService;
	@Autowired
	public TProductOpenService tProductOpenService;
	@Autowired
	public TProductsService tProductsService;
	@Autowired
	public TVideosService tVideosService;
	@Autowired
	public TFriendLinkService tFriendLinkService;
	@Autowired
	public TPackageService tPackageService;
	@Autowired
	public TProductOsService tProductOsService;
	@Autowired
	public TUserService tUserService;
}
