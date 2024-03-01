Return-Path: <linux-kbuild+bounces-1101-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FB286E351
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Mar 2024 15:28:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC732284EE7
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Mar 2024 14:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61EB06F08B;
	Fri,  1 Mar 2024 14:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RB1JJcdn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52526F086
	for <linux-kbuild@vger.kernel.org>; Fri,  1 Mar 2024 14:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709303330; cv=none; b=Zj+1CvS7Hj84703daRltQMMC2I3zVBV2wRdf6WhhceOL09if4yls679xI4H6g1BcZ+3w4jcoC7YSZPMAu0YIYrkkE6OycL5xsXWrlf/mzFN51BWsh+/2m2LgPqIUMTZSDuJFnQEoEaVpgrywqWoDpEI950jzJspgCkr0A2G/3R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709303330; c=relaxed/simple;
	bh=ZVq45iwqsG17CN1iAMkyO96jiCcKXjjAeEZengwDKsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WLxYQRTekM+O1XfWxiX3VGFx7ACxrEVCwUULNUHrJxynL02UDmMXGgIhJp75nHUq38zSDCFw4w/ZRQCLfaFJ3YojaBa2TJxCqZ2l3n3go5bEHdDjQJCGdawryWXAiza0ASMdaIhcxGN+1szQoJ/5uiT5gHGsO87vT5BTUOwKg/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RB1JJcdn; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1dca3951ad9so19988425ad.3
        for <linux-kbuild@vger.kernel.org>; Fri, 01 Mar 2024 06:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709303328; x=1709908128; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YMwRXwe+WE4PmWyg7QcOgH8u3JqX1lp4xE3bFVh73Lo=;
        b=RB1JJcdnRHiZPjeQmqe0b14Qdi5hXYFV1RoJl5rOYUrqP+RB9GWHWl5YCDac0BmTjI
         P4JR91gQZ4xNutAoBynVD15XCobb9LmNI324E1hYw5B/lXzUUJryFsG4iY71PeodU+um
         yrBvm+iq1HXqT+k7/MPGfCdUvMmhWEgaA16HA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709303328; x=1709908128;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YMwRXwe+WE4PmWyg7QcOgH8u3JqX1lp4xE3bFVh73Lo=;
        b=ugbbpkxD+LKIaJDGqN7F6nTVtGisobVxNF7DmpufOVOIurYGxNln9EkmhK+tMsu7vL
         yF8ikfncQqJK3s3a0Onx/FQnYibNgaBtKxOQB2nWg7iQQDb4x2WZfegcashnvY1sF00q
         gQVChwustczQRgJxJi12Hi8V3j4ZXV3e4Etu8uL8tl30f6I6ciBTTV8rf1svo+i2WJ0h
         oBcORoc7jjbwkQfdvZ3MpFbLBiT5H7OK2Thli0Zf0+b+9IzKPr4ABzdRbms5xeh6bej7
         hBGfMr83vCK8zp4FGXY9SyuKAxDoF2V6Q7LGIFPzKt27mDG2HeH92Mv/H07e/Z5yB199
         +BGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNIzYX2D6hdKQCSZdAm3sraTwIVpy3Ww6I87NE1m7XcwrnfWvEybqTZZNi9QAaGdyDSNgi1H0pywzqC9k+TdycRNF8d1icRzquLEOz
X-Gm-Message-State: AOJu0YxHiMEbf3kvpOyVJzDuHTUMLeepOKk2NFwZGsoYRTP90/c69bsQ
	8Os393IWy2alRHfrWZf8MgVIqRMb1SyBnGwHjBdD+5ZTNSPfnrJHdZp7u2Qd0y8PmVI3EQF6oKW
	dfA==
X-Google-Smtp-Source: AGHT+IF3JYaaA2kDPKfjoPvxAteo5f9it2zlkoKChQrKKyJaqyC0VWGe0qug0CkXYW6VQPFMzExkPQ==
X-Received: by 2002:a17:90a:bc06:b0:29b:2d64:68e5 with SMTP id w6-20020a17090abc0600b0029b2d6468e5mr612640pjr.31.1709303328305;
        Fri, 01 Mar 2024 06:28:48 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:cf6e:4396:e942:479d])
        by smtp.gmail.com with ESMTPSA id sz3-20020a17090b2d4300b002961a383303sm5429288pjb.14.2024.03.01.06.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 06:28:47 -0800 (PST)
Date: Fri, 1 Mar 2024 23:28:44 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Nicolas Schier <n.schier@avm.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2] kconfig: add some Kconfig env variables to make help
Message-ID: <20240301142844.GP11972@google.com>
References: <CAK7LNARo4L6qxoqRU-0dgABarukJKAaZpCRtfA3MyUHhSuDQxQ@mail.gmail.com>
 <20240222051621.GH11472@google.com>
 <20240228045652.GH11972@google.com>
 <CAK7LNAQ8OyNMeGzVoTRg-sHDZ4YK0EKY_eEWNepekaibO_ZKwg@mail.gmail.com>
 <20240229021010.GM11972@google.com>
 <CAK7LNASujf8m4PpMyoCC1cTN_YGeG1HVaOR+3pZx5=3OJp=85A@mail.gmail.com>
 <20240229034739.GN11972@google.com>
 <CAK7LNAS-mOxY884pLEMwWaX+wgzXdc6+=vqN=wfHBekuKL5ryA@mail.gmail.com>
 <20240301043316.GO11972@google.com>
 <ZeG2PRYmdO0r44kS@buildd.core.avm.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZeG2PRYmdO0r44kS@buildd.core.avm.de>

On (24/03/01 12:04), Nicolas Schier wrote:
> Perhaps it might be a compromise to let 'make help' point to the
> kbuild/kconfig documentation?

Yes, I was thinking the same. A one-liner description per-env var
and point to documentation if one-liner is not enough

	KCONFIG_BARREL_ROLL	- kconfig does a barrel roll
	KCONFIG_FOO_BAR		- kconfig does foo and then bar (see
	documentation for details)

