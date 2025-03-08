Return-Path: <linux-kbuild+bounces-6018-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF90DA57C00
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Mar 2025 17:35:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 225443B0938
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Mar 2025 16:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B19501E51EF;
	Sat,  8 Mar 2025 16:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="QYZ/duUf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628A61DEFFD;
	Sat,  8 Mar 2025 16:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741451709; cv=none; b=I00oFtddU0lHycpWnTs+5sPI1b8ljFH05y2Eo7RQPLixiXMDJTSPKkge2+DVavgJOfjtAHIwJLh/ft8706i5/gGMGL7Df4bIAQs+xuZLB2Rr8OpqlaG9MzWxa0jahM/t4MGTrEfnlBpHsHLf1/W3P+1VUaGAVYetlpKIfBcCtDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741451709; c=relaxed/simple;
	bh=S2Z87NhoeMoo/yEoL7zGVVamFTgnjPyzS8nkGC5Zaaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tuyKD+c+Yc/rPzWlQN5Hq+bNZPAmHAzQ9hIkstLmtUmHuGcuYZ2Rq2s02wUpPD7tnn3yojRvUeHZrDwfllXtCbm2uqgsx4A+hJURz3ccDZ/LneNOkeeUwwKcjKHTdQbcJDMsUaMRNmW4b1cDm2nkLmK2PUZKpiIjq0HwEYGqk1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=QYZ/duUf; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 10BA940E01D1;
	Sat,  8 Mar 2025 16:35:04 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 6DTev5gIDLn6; Sat,  8 Mar 2025 16:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1741451700; bh=wlqqzDLek9tt9qzINaZwwqLM1ULCZb0Yz7fHzSh1E3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QYZ/duUf9SVKDE3Nzie2SWAi3vFCz/DImdZasqJ/D81limFjgiNqkI+BmG/HaTDxc
	 vk4ygwnggJlzyYMSN5UGAHX0DRsdjyGBO3QEkpJkXNtHi4WNDd6d+tfrBU60AmclQ7
	 hGmSCBtpmjJIDcTdWfdSaJyMmPzQlDLHRGmkoi0T8B2QIzPkeWGwvKIXaiDwMRUrq/
	 oB9BtgUeFs/Ls44os6TsFd1dVr0xgQ2RzvXbSfTlvkIB/CnsG+jJu0DcatfRqOpMpJ
	 P4ld6QqeeR+cxxbd9mhN11hAh3Ja6h14PuH+W0XeQp7eFD+MLWW2JgbPqDx4NcohDQ
	 sMifoNTcvenIUHmjxEn9ojtdb/QHNQe2s1jSJBxGPFQ45UdQ7HW7lv0wSrkQTaYU37
	 G73nbwQoihBRGgFL54TnwNCrceS5wfdLlSoIPjnA4nWLj1aLK+uGwkY3Z5dQeTnaA8
	 RgFpvD8QAsuEPU1GTiEaYgsDIqiqwequDZwAFMoUEBpndEmNuLGMRkfoZETFw3MEr3
	 qioEZh/+FEv8g2TAtcnSfw5x4xq18S5sKvb8B8Ed2+gW4O3glGOY6TgPceA5dL4K41
	 6DIQVOD7IGQQt9dNBJkmu0SmuX/z1pm8ES3tk8vQAejNKaDtrZipo++bmgfynxbQsQ
	 COBd2F4EGjA16UIgAGIhVkF4=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 8B19A40E015D;
	Sat,  8 Mar 2025 16:34:52 +0000 (UTC)
Date: Sat, 8 Mar 2025 17:34:51 +0100
From: Borislav Petkov <bp@alien8.de>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: "Xin Li (Intel)" <xin@zytor.com>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, nathan@kernel.org, nicolas@fjasle.eu,
	hpa@zytor.com, sraithal@amd.com
Subject: Re: [PATCH v1 1/1] kbuild: Add "make headers" to "make help" output
Message-ID: <20250308163451.GEZ8xxq9WzBeZRBYpl@fat_crate.local>
References: <20250308040451.585561-1-xin@zytor.com>
 <20250308103437.GAZ8wdPbFGfhzAi1WU@fat_crate.local>
 <CAK7LNASytr9fjfv-9Yt5_9MaKkrdKirjoBPqucEAGgM88uxD2w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK7LNASytr9fjfv-9Yt5_9MaKkrdKirjoBPqucEAGgM88uxD2w@mail.gmail.com>

On Sun, Mar 09, 2025 at 12:15:21AM +0900, Masahiro Yamada wrote:
> > It is INSTALL_HDR_PATH too, try:
> >
> > make O=/tmp/b/ headers
> >
> > for example.
> 
> No.   usr/include

Yes, ok, "usr/include" is a relative path but it should at least say
*relative* to the current output directory so that it is perfectly clear.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

