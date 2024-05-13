Return-Path: <linux-kbuild+bounces-1846-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 015CE8C4A07
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 May 2024 01:28:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B80C2283E65
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 May 2024 23:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D08785622;
	Mon, 13 May 2024 23:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Iwklbf9+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0271446BD
	for <linux-kbuild@vger.kernel.org>; Mon, 13 May 2024 23:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715642908; cv=none; b=rTvpd2IKggGm9poByN9IP+9HLS4H+chpZZI/MIFjCrpGjKjrZxrPV5M8bVHHuIzU0XlhPhQAKOb3sYTxHMwz3nKK8O48aRXZWNVdilWyx5xZpXBfzm412eLpv8O5pNzZhTNg3pQj8TzTeTjAGqAXLHhmnOmqLoMC7eyf2Bpw3R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715642908; c=relaxed/simple;
	bh=FK/pOlv8p257iH5M65SUDFW31ZwENP3sUAncbWrb2UM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yv2RWZrwbvPjNimFNEpcJkBhyqVCP+78jPa5TQ1Af9T2e4r+iH3hT8/53vgvztpNPa1zulhfGOBVei6YdiQNv3D/mxp7WgMnavCbhUhCQrrn7ehdk10TI9tftENGwRDg/8n7cqx/SmJQoWAELGzS8a33HLqPSdf68MbV8w2C4zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Iwklbf9+; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2b6456f7e94so3734636a91.1
        for <linux-kbuild@vger.kernel.org>; Mon, 13 May 2024 16:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715642906; x=1716247706; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Alp79KUasntAH1xAOt+qh9t4wrzIhrRSX97PEjrZLDc=;
        b=Iwklbf9+elmKMIJNZC5JlY5Dgm8Sqo6bOGVL2h+cjBGV0hwkHTOwKHWMQ7LrW92oh6
         tX2cKiKifvFY+PnDbBdRlieMj3r2qJvtX035ZGqUfppuwZBfw3dpexgQf0lpdxrOc2xi
         RXXuAOI6iSl+rSmIv//TvYamEErrIk2FtK+ms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715642906; x=1716247706;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Alp79KUasntAH1xAOt+qh9t4wrzIhrRSX97PEjrZLDc=;
        b=Un3JwN8oto3cQDdZapEawA/+u0DW3fefDjc/Mat7O4OG6166ESl2xh5M3JD416q8Wv
         Iar76l5q4ppA3O4zfAkAj6s67Yrh7IrBRPgB7DxbgVR6gnJQcXqDhMh/Nrvdx3Rl900A
         0X+CZyUBNhLvDte6MHaovGLThN+VYcuQBK0XRdflJ/lhZY46Ye9NqpN46x+WpuyGeBGc
         Xcig2nQkO0T5ZwHRak3MHI6KkK6IG9eKwvmMqJJNt6Db8tiiMRQHZF4RA1JjPBYNj5X5
         MXjuU5xgOd96l9EcaM6i0Xy+sfc0D+w4OM0W3ILg6X0t7/G4Tf6bMdtxACvVDA0kDvdA
         eAdQ==
X-Gm-Message-State: AOJu0YwYi2J26FPdY2LqYINcl9BEduKBh3yqv2gFhH7Eh25ksPutfk+4
	VfoOzXVcF1wNxarl2Je2KVmLaXXng/4jZnCGAZ86LddP54MPOClVS7XOGy5J5w==
X-Google-Smtp-Source: AGHT+IEFgmE7chs18iM9GrKNc3YSJsTec4uS+kF7AHYYIMLhQ7Or1D9QN4CNuHbEiHbakVLBZ9zUHA==
X-Received: by 2002:a17:90a:bf08:b0:2b2:7c65:f050 with SMTP id 98e67ed59e1d1-2b65effb9d4mr20481677a91.0.1715642906269;
        Mon, 13 May 2024 16:28:26 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b62863cd9dsm10304270a91.12.2024.05.13.16.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 16:28:25 -0700 (PDT)
Date: Mon, 13 May 2024 16:28:25 -0700
From: Kees Cook <keescook@chromium.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Marco Elver <elver@google.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Peter Oberparleiter <oberpar@linux.ibm.com>,
	Roberto Sassu <roberto.sassu@huaweicloud.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	kasan-dev@googlegroups.com, linux-hardening@vger.kernel.org
Subject: Re: [PATCH 0/3] kbuild: remove many tool coverage variables
Message-ID: <202405131626.D61F8228@keescook>
References: <20240506133544.2861555-1-masahiroy@kernel.org>
 <202405131136.73E766AA8@keescook>
 <CAK7LNARZuqxWyxn2peMCCt0gbsRdWjri=Pd9-HvpK7bcOB-9dA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNARZuqxWyxn2peMCCt0gbsRdWjri=Pd9-HvpK7bcOB-9dA@mail.gmail.com>

On Tue, May 14, 2024 at 07:39:31AM +0900, Masahiro Yamada wrote:
> On Tue, May 14, 2024 at 3:48 AM Kees Cook <keescook@chromium.org> wrote:
> > I am worried about the use of "guess" and "most", though. :) Before, we
> > had some clear opt-out situations, and now it's more of a side-effect. I
> > think this is okay, but I'd really like to know more about your testing.
> 
> - defconfig for arc, hexagon, loongarch, microblaze, sh, xtensa
> - allmodconfig for the other architectures
> 
> (IIRC, allmodconfig failed for the first case, for reasons unrelated
> to this patch set, so I used defconfig instead.
> I do not remember what errors I observed)
> 
> I checked the diff of .*.cmd files.

Ah-ha, perfect! Thanks. :)

> > Did you find any cases where you found that instrumentation was _removed_
> > where not expected?
> 
> See the commit log of 1/3.

Okay, thanks. I wasn't sure if that was the complete set or just part of
the "most" bit. :)

Thanks! I think this should all be fine. I'm not aware of anything
melting down yet from these changes being in -next, so:

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

