Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EE52331B0
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Jun 2019 16:05:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728768AbfFCOFY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 3 Jun 2019 10:05:24 -0400
Received: from sonic307-3.consmr.mail.ne1.yahoo.com ([66.163.190.122]:39680
        "EHLO sonic307-3.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728604AbfFCOFX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Jun 2019 10:05:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1559570722; bh=QI8/VmbjVWYkTXliT6IkkpsE6DvYpw93p0qmwA+i8sY=; h=Date:From:Reply-To:Subject:References:From:Subject; b=BUm+IBze6L0/y9NuyIii/xh++TUTpUryCvbZ59wm/v6mVW0m6UljkRTdqpABXyxFtskVJr5z+Cx2k3xXfWaVJafirZI2Y5ph/VaS/a3iOTp86vJqdKcdS4pd71mOrb65oDM5Mx0HO22NGeajfYYJ73i6zxbdUj2TYxmqlswVi9HJymdU1eVtJ6T/bf2AsSD4vODq+znFcjv6ysHr7IdxOo0xQCVjFTJi/Xiq74htg9Q+ylJsrAta+aCFnQyKz/X7Z4N8mgsEWdXi9n+RrDyw0YiO3fOPh3sVsGsTOaOMWdUv5OEySTO18cTGGw/qgPjnkPayGvsBpkdleUm1zIFriA==
X-YMail-OSG: zX74QJcVM1lbA13.Xyw762RT0g6M_U._BKbjrbJsdL0WGmEcq7xUZrJ9u4Q6yGC
 ZrgC6cSwsuYG_WcUaXDLB5MdeZq0LY00JjSugYCl584Gf2MqfG8rKnlb7uf0zW0KCJYO.7of2AJ1
 2CkPWi0Dco7cunVorar8aqiSjJKPDwNHsnrjac3HuTac.7nTd0JxT9oIWjTdApxofTvaF_u6R8.q
 9qi9Q5XRUUo8cZVngBBfEqh6.EAf6LWVFbuarzW0.DBX_wUYyY13GEU_ezR00eRTT4mrWYg.Sfp1
 lxbkh4ZCU7eT_TZMOTkyg3kvgEYmoTXFbxkDhG.sSzD9Zb8stzASLKWhnjYwd29VeXrDPiQOnyJI
 YorVgZjapvX2p9p8Kc5V6Le_2lPFELVtSQArXC2OMwr12TjpOUNhNCf4SH_nCyhp6N.VlMQuGFYp
 Se3dSdl6FX98jh56LOViTnlzJsTRVaOD3SJ7jnq1pcet2ZSIZ4niWgFNgI6Z8lYuS2hj4BIz9FED
 kc1I7CCFg4iNek6TDvkPJ.0sWps3yWxv9dkyyWW099Z7U9CRy.XGa494z4qSAA4bU188ghO2JE7n
 geig.VdDA3osL4jQBXQtx9QaSS.riFezv4alK9Zf9oJVsEnME6enY_I.WDkT_NyzjAme4ThxD8R9
 rfHKDgCw4Sln5cqc8M0aLIq_.I988yKLifXL4jLIgXNKFddK4d2P3B.0kAeakiCLV9KnN_81TGeL
 WMfohuT1Bq6snsnXomjyDp1rJF9lmEctFJMBdnk0_yDMwhzzQi5TAJc6eghtiKHyTEIpIzXQqmTs
 xMP_r4Id5VEPpI09L1NGIiIXwm1jWk8471CT36g9sA_YdVimhUNB1GEDhkgll1NJw1yiSCdLkK9U
 Vocg9EbgriIurkPEiDSsHjeqCc2NHS3S.jLNrEaKSkEy6xusUQ5DdqKjDlEfYw4gWCSEhN_n7X4c
 KbeOKVMIIiw376bw.r1etw3Pk.epW4Genrii0e43RFS3ugvu4.zX9gXE2dt583I4encoKqwgVQ8t
 IN6FS7HX8aafOMVI_ogrw2seNtoaWlp7r9miDLOwn4jMpMJrY3XXisq0tbhoiIb9lcRSgojqmwKl
 VYQZLAPND7o7aNs2skXf7J8V.uzFO_egP2BOAI2sd2QVHerg_ckRK54W2K_.TCQcg0mTVizwiAv8
 v1.CsF8eZvYKYR4n4mPn2EA5uJVwJlPIEFSjfEy8PSlsZ2vHLf0ZqhRvAhKHQtGgVA3ueqsoxhH1
 nCPraMuiay6WmpJssKudfL7LC7A--
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.ne1.yahoo.com with HTTP; Mon, 3 Jun 2019 14:05:22 +0000
Date:   Mon, 3 Jun 2019 14:03:21 +0000 (UTC)
From:   Major Dennis Hornbeck <ee36@bkgriup.online>
Reply-To: Major Dennis Hornbeck <hornbeckmajordennis634@gmail.com>
Message-ID: <346673927.11422944.1559570601167@mail.yahoo.com>
Subject: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <346673927.11422944.1559570601167.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.13634 YahooMailBasic Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

I am in the military unit here in Afghanistan, we have some amount of funds that we want to move out of the country. My partners and I need a good partner someone we can trust. It is risk free and legal. Reply to this email: hornbeckmajordennis634@gmail.com


Regards,
Major Dennis Hornbeck.
