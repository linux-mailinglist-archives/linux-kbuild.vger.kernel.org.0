Return-Path: <linux-kbuild+bounces-10199-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECB4CCEB8C
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Dec 2025 08:09:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D52B33042FC8
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Dec 2025 07:08:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E58492D73B4;
	Fri, 19 Dec 2025 07:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zOsIxQbN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DFC25E469
	for <linux-kbuild@vger.kernel.org>; Fri, 19 Dec 2025 07:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766128102; cv=none; b=P4/O4Gl3TsU2AvxMqoN41xBF1ryJov37m9VytAFzDcs2vMHvOtJBdLsfFEgIhYgXMnLGUjIMe+gTQ6shgnxQ2FG5oUuiIIJHVx0JnvG+XD5N6BjlHnF00qJ8/k/5VoMbr4jKWZUJRb09XNO63XNdCRubRiu7jzfQUF3O0Qq7khk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766128102; c=relaxed/simple;
	bh=chHA3d/r7DdTP2+uwfGEKmhVONsNEHk52FbSC3FS8p0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MjohG9a6rL8xaEbd30mXuSv4KH/wz18c051OubKmY5XzMCGINIr8kuHMPcrjt+q+101mffo3zQr9wZIYsgBr+RN7x974uBWHr1xoIsmB1LHYv3SNHkcA94aWdQCoEJMBAUowOkSTHfJhwfo9R4deEsDjhqe5fc57S8DnJ+IYFv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zOsIxQbN; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47d1d8a49f5so718835e9.3
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Dec 2025 23:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766128099; x=1766732899; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NAJFCYxG6tBk/5BjvMlMhhFWKmM1Im0nbCMAsTTFzMc=;
        b=zOsIxQbNWbyo2BDTEHAYEqmGQOGxHNG2ddYAmFoAsdej4tI1cRCwo8MO2edeNIwC3t
         ssqiCryE+KHhp1+7RNnfJCadukVq+xY0EIOqWnbl/G6y/YpalSoA14OXWS5S57Pi44fv
         blEDXwNfBTmoEaMhiGbwqzUWq42tY1rTno7pClEyC08QtOyiejFYdneyV+wh6smHyiVm
         1n8bFkw0YAj0sCx32pDBnRRZod5EEid7MxYdgMj7PgcRw+Bkm2xu75JLiYAecljV9iW3
         9RSaV/UPGw0mCn6dDv9wKCyci9DMXRq89OUlHlZ7xt8G+56NmBwOhnABAevYz9LzDfNE
         99RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766128099; x=1766732899;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NAJFCYxG6tBk/5BjvMlMhhFWKmM1Im0nbCMAsTTFzMc=;
        b=AVPH52ejvw+FFksED6OBrf/qe10CTb+/ZhkmH1ApKUR3j9tUzbjlGAy/q0ZKY9bTbC
         KETCSBm6BtpaYFxHkOJeLsQTVQy1/loGjh1YK+XJqd+f7E33Qzy4k0bBvhtj7l5IoybW
         gSL3G7oUgEnzUfgw7Ys3zBSzUHboib15MVyC0GbFYHDRN/85VRl3ScQVOTXke3qgrIFt
         F4ambn9lfC/av7o7S6Y421JR1YimD4jsVy1ALfACVLJ0g4ysHSDzG2iT4VwEJA85vhAL
         Q7Ys7GaGf8Nmzy8nThGy3Vp8nVPrSZRlbF8SmVqqd9Q0+Nt+2fjFVP2qbF5SqQqX1IXe
         9jwQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7Zu5aLc4rDpTC+iBKKguVBpl+GDAZTaXy+OANaB+qLrKto+9nSoBo2xE0sbjsCokJLPYWKJmmy0vWOqo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuqfwVNUyPReVxnsMV50bMZrb8kd0sxdQ0HVHvTJ2PUkd/pUsd
	TYjjwmCNxVkpG0v6KMB8dFEiV8ewR7IVfL9qfZluRcolIuh2rHKxmEXGs1n9RFAtpvc=
X-Gm-Gg: AY/fxX6G1tx6Q2JQV+xP4vnAFNQgdxfrEMzmOMyXpooLf8a6ldGBHjUyME++DIEs68P
	y8jheY9/CUPl4nCHVjS+euFGF8xyokE1DxSoALR72RoyYU8AHdQupfdvLumMeGlxTfqUm95af98
	/NZYmu2d3/RFeU0FZQh3RzthyFWvhzztNAKYwvpOrchHesUqOqjjgVbElkFNEAVY4vVQHbfaR3p
	9eirwq5DWuvaYPKTs7zzYRnmD5GB6g2IQ1KNEZvB7Bc5blQLqSNMeDWeBxcwgTVfhsLAxXaTihu
	m4n8ORGpkrSJhd87MOFuJOnI4rtaLCtUKyN2Yi9hoyMOkJmtgrobgNmkeGZ1UTcJNnlZqTv7G2N
	+M38IW1EmuDYNJwnbzR72w3q+Kk2+w4wZG9aHS6BcCnBxVtw1sXhTYj8RSs/OqjMQIhj5H8LEmb
	2wngItPcTgUQGznfzH
X-Google-Smtp-Source: AGHT+IE7nLrq263HAsObO9ho2ijSSwzHrCJiIV0bJrGj7M+qZEd9hC4pZGfJYlq78GqHGGWD40y0tA==
X-Received: by 2002:a05:600c:5251:b0:477:8a29:582c with SMTP id 5b1f17b1804b1-47d195a425bmr13555325e9.34.1766128099504;
        Thu, 18 Dec 2025 23:08:19 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be27b749esm81591275e9.14.2025.12.18.23.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 23:08:19 -0800 (PST)
Date: Fri, 19 Dec 2025 10:08:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Vincent Mailhol <mailhol@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>,
	linux-kbuild@vger.kernel.org, linux-sparse@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	dri-devel@lists.freedesktop.org, linux-btrfs@vger.kernel.org
Subject: Re: [PATCH 0/2] kbuild: remove gcc's -Wtype-limits
Message-ID: <aUT54I0fD0aqBVyw@stanley.mountain>
References: <20251218-remove_wtype-limits-v1-0-735417536787@kernel.org>
 <20251218202644.0bd24aa8@pumpkin>
 <CAHk-=wjrNyuMfkU2RHs28TbFGSORk45mkjtzqeB7uhYJx33Vuw@mail.gmail.com>
 <20251218220651.5cdde06f@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218220651.5cdde06f@pumpkin>

On Thu, Dec 18, 2025 at 10:06:51PM +0000, David Laight wrote:
> On Fri, 19 Dec 2025 08:34:05 +1200
> Linus Torvalds <torvalds@linux-foundation.org> wrote:
> 
> > On Fri, 19 Dec 2025 at 08:26, David Laight <david.laight.linux@gmail.com> wrote:
> > >
> > > One possibility is to conditionally add _Pragma()  
> > 
> > No. That compiler warning is pure and utter garbage. I have pointed it
> > out fopr *years*, and compiler people don't get it.
> > 
> > So that warning just needs to die. It's shit. It's wrong.
> 
> True - especially for code like:
> 	if (x < 0 || x > limit)
> 		return ...
> where the code is correct even with 'accidental' conversion of a
> negative signed value to a large unsigned one.
> 
> clang seems to have a dozen similar warnings, all of which are a PITA
> for kernel code - like rejecting !(4 << 16).

In this example is 4 a literal or do we at least know that 4 is
non-zero?

I really thought I had a check for that in Smatch but I guess I
don't...

regards,
dan carpenter


