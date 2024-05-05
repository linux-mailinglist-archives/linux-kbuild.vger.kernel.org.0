Return-Path: <linux-kbuild+bounces-1773-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5892B8BBF55
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 May 2024 07:33:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4811C280A99
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 May 2024 05:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CF67187F;
	Sun,  5 May 2024 05:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MYJNtstx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E095B1869;
	Sun,  5 May 2024 05:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714887203; cv=none; b=TAYoutn651aXbnYQ/Dz+E5/YSj6iIJ20DRLQ5GD8O1oGmAld2EsoANulEQJS3KZ4QF0gzvOo+wAT12bCNLURm5JcAH7Gam/o3Ddwwx3lpf5cOWz40NBXZhoBjxVQLVuJuXCQvIYhYPImPeoL4Uv60TOe6GmZ6ssT0ggNnE27EB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714887203; c=relaxed/simple;
	bh=jgTuXIYNgK/keCCQEhuADErR0CCxmTANNyFYfmtAwOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pH8WxSjgtmT8FW+208OaWtLJGoH0mbgyX4/yxvV3D3hj+k0nnDdAcxK0W/AXMqwlZGZ1CbSa7TCSPMHNmokZY3P/E3kGOUaCGg9fAw6QB+6SaUSkmNLXBQMBJ5ts4wWfb6OARCDL1nqwyjy36Hadi7h0ENInrQetB00V4gvSpQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MYJNtstx; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a59b81d087aso99800966b.3;
        Sat, 04 May 2024 22:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714887200; x=1715492000; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IhbKPoUo2AfEKlEHAGtLiiesjNpccXRJK9R/FHDexKs=;
        b=MYJNtstxE4Bz6aR4oWsuxaNEt2B5P3fD4MMVRuMyKEBUCFpa2dl91v1MMstNcjfo+F
         mC+MOuPZydhukNEeiqFnLWPNRK8TfJ/KY0K89PCmAB/xuPQYYmiA1lSYutnzwlrsVaRE
         1H13GG/7UT7H/JD1A/c+D/5wPSR/dEVMN+rD1+MqwVQMY2o/PfgH7Wccz+Je+M8rhy/9
         fC6KMuwLz2PiD3aJKKxD0KVCD9VJv33ge/qyWj0YpZjDgpUst+Lu1RtzV5u4ZoqT64pd
         5i1IAOocJKS1FAyoZoCZILekf6mOeCkPd+9N4JUSwY+m2vfx8rfAxxkxdJI2CriXACku
         JC7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714887200; x=1715492000;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IhbKPoUo2AfEKlEHAGtLiiesjNpccXRJK9R/FHDexKs=;
        b=X7RJ+wCAZt8yWRziRs9IH7bKXiNsWK+GMmH1tkeZ0mF5D/fpnaII2nmJmyubLlX2xX
         aZMFxzhrEvueLardINPjcF724DRqg6KcBA59a76EAWRAVP6o5xXQSSDNKQD8BPBZz3sY
         3lq9INO/I1BCBnsexEiin/JnLnVPStEdRKRHnrHsDiO8sbAiK/LkZIuwpvSHqmiMTZ0U
         fjFOldAE3GWuaeDmz8Vr0y2gg8tjdHpkTOib6iC2K3whs27tmCImPcbSWWYATQsOcf44
         D7IxKUZ+0EvEKKcbOpbPvTIcCRTU45O1XBRxHCcdEPym13S0XH6MiWqcHRc1GEXh3mna
         dF2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWH7JLuCHrAzsZpKe9pu9AlzlFe7d7X72LTU82rxo4LYzhitZ4NwHw6rklKwxqlbeGid00HaWNuIhkGv3VVq6C99Nwn8kGyILmhHjOQ7/ah+vCB/DwTilejYxQTcSZUxYopcZt1UPaJJsb4
X-Gm-Message-State: AOJu0YwD355KyUv04T9CwLL28CT+vgjHI3AvPvKkA9dFtSdbTiDwuLro
	55fUHwqbfAOmj84/3PrNIUHRMag68Jj4YRQ0gL2BzO9D8dTVCgf1J3vttk3X
X-Google-Smtp-Source: AGHT+IFoq++RFvtGCWJvnNfQHGZGxoj9s5odKIJyOOjxf/ws01TzZimd2+XIy2K4iqyd1+/GXBGVkA==
X-Received: by 2002:a50:874b:0:b0:572:a14b:2d2d with SMTP id 11-20020a50874b000000b00572a14b2d2dmr6442288edv.31.1714887199857;
        Sat, 04 May 2024 22:33:19 -0700 (PDT)
Received: from gmail.com (1F2EF54C.unconfigured.pool.telekom.hu. [31.46.245.76])
        by smtp.gmail.com with ESMTPSA id u21-20020a50a415000000b00572890bd6aasm3751518edb.95.2024.05.04.22.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 22:33:19 -0700 (PDT)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date: Sun, 5 May 2024 07:33:17 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: [GIT PULL] Kbuild updates for v6.9-rc1
Message-ID: <ZjcaHRjZDdy/6/rn@gmail.com>
References: <CAK7LNARXef6Myb_Gd4jyGfwujoBAjmjzLZBzgkm4T1KmfHP0MQ@mail.gmail.com>
 <ZjcRPelwZP34N42s@gmail.com>
 <ZjcSjk0mXYopAvVS@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZjcSjk0mXYopAvVS@gmail.com>


* Ingo Molnar <mingo@kernel.org> wrote:

> 
> * Ingo Molnar <mingo@kernel.org> wrote:
> 
> > Notes:
> > 
> > - Yes, those weird 'file' and ': No such file or directory' strings are 
> >   pasted as-is. No idea what it's about, and the build log doesn't say.
> 
> Forgot to mention that I also did a KBUILD_VERBOSE=2 build - which isn't 
> more verbose for this particular failure:

Another update - I reverted the 4 most recent commits to 
scripts/package/debian/rules:

 b8d18fee7aa2 Revert "kbuild: deb-pkg: show verbose log for direct package builds"
 82ac586caf3d Revert "kbuild: deb-pkg: make debian/rules quiet for 'make deb-pkg'"
 0b806eac90d6 Revert "kbuild: deb-pkg: build binary-arch in parallel"
 4b16391dc462 Revert "kbuild: deb-pkg: call more misc debhelper commands"
 f96beb84eff6 kbuild: deb-pkg: call more misc debhelper commands
 1d7bae8f8c85 kbuild: deb-pkg: build binary-arch in parallel
 caf400c8b68a kbuild: deb-pkg: make debian/rules quiet for 'make deb-pkg'
 cc3df32c9f3a kbuild: deb-pkg: show verbose log for direct package builds

And this resolved the issue, the debs are built successfully:

 ...
 dpkg-deb: building package 'linux-image-6.9.0-rc6-tip-00478-gb8d18fee7aa2-dbg' in '../linux-image-6.9.0-rc6-tip-00478-gb8d18fee7aa2-dbg_6.9.0-rc6-00478-gb8d18fee7aa2-8_amd64.deb'.
  dpkg-genbuildinfo --build=binary -O../linux-upstream_6.9.0-rc6-00478-gb8d18fee7aa2-8_amd64.buildinfo
  dpkg-genchanges --build=binary -O../linux-upstream_6.9.0-rc6-00478-gb8d18fee7aa2-8_amd64.changes
 dpkg-genchanges: info: binary-only upload (no source code included)
  dpkg-source --after-build .
 dpkg-buildpackage: info: binary-only upload (no source included)
 
Thanks,

	Ingo

