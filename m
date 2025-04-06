Return-Path: <linux-kbuild+bounces-6456-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E40A7CE96
	for <lists+linux-kbuild@lfdr.de>; Sun,  6 Apr 2025 17:24:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C1B816A67D
	for <lists+linux-kbuild@lfdr.de>; Sun,  6 Apr 2025 15:23:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22B0D1A0BF8;
	Sun,  6 Apr 2025 15:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EuPgGVau"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CAC22094;
	Sun,  6 Apr 2025 15:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743953030; cv=none; b=qzOCBr+F6sDESeY4l8Ov9wuduxqfx5k75bzl7Ok02e4/+goT8XaKV9Fr5sBPCnxWWTW9/JO8EUHsnGO/CX47Hd1MMNykqWD+P5Ev0cJtFsYoCIgr08iOMEna6kfx0pzeg7lQaraa0b7JeutAt0b6ygQlaCaY5PQJZ5QiQZs8F7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743953030; c=relaxed/simple;
	bh=esmqvsAQgW5FTEvurBqdCUw+FcryxsR8GAQHdnQsUI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ADJb7ax72/CHDGXkg11GXkEsJJkaBSsN7JTm4TcVy+nvprPi/wZ6Q7m2TZNNTaSCX4puXpvYxSeQtY2fsBaHpsARrWFw6bzteaZn/kD3rNoSHyWKdOT95jSTY1EOwzMViKTTs39+NbAEITAP4stJrbWNSlqJNuYXQU0PmRwcyEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EuPgGVau; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22438c356c8so33401115ad.1;
        Sun, 06 Apr 2025 08:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743953027; x=1744557827; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qmXcbqtlb8gz+7KO/eJn5VWDkex34Rws6DctKPk9IZo=;
        b=EuPgGVauc8ukvnbRpn1Bm22NvYCgLYJNvZmbe4F3EimAhEXuTV5PuZ/l5WTpoPGyqy
         0Lm9Kg9r0TYx1beixTiGa0qgFBkhyNVSD3Gj9HwwAsWt7ka8H3nR73RqUFpHoYOZNjxR
         vXox+Xj/NFc5UTjTmzeYKktchcDgxMWuwR4EPuSeI6s4IQiLxZ1a8WdEgzNJn+V1T5OT
         weP36mnxOhmnfIPW85xxHrUP9t9C3qiDpONq9tjJQ40EHie9VTGr0Rrm6r3nAuUCHC+j
         v1xzqK0SyFTvfbqGxSdZaAD2AneVSNh/VRre2wrwGlsWOM5n6WQllyXkNCQ1hdxqAa1o
         eNBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743953027; x=1744557827;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qmXcbqtlb8gz+7KO/eJn5VWDkex34Rws6DctKPk9IZo=;
        b=G6i7S9n2KN68RSCfhQ4M4dpWPfeFi1pBlYHaMiQ0ZK0thKAl2vr8C/qea90R298eTC
         NsgyU7JEvpPuGOL3z181cApFiHArmd+uIvowSLkXpBw/BG/TwviUuwfR6x+fsuWuQ7p8
         IySVNs+hVv+ZDJgcmENoaLy46AE+U6iIpz5PVhwwn8JWmNSOC1sN4kZO/7VIMOeZM66o
         vHbHf/w/mGzdTx5JmRbJp/1vI/7y5u8cHf4EeD8IbUg0sULYkrVLjFWMREZUxZ1rYgdA
         I87mxa5VTnzYCjeJUhkaWWAy3I6vkF4YRO+bUGbfvrlUAfu1d/w0PaoLE9C9AxJY28fo
         GmlA==
X-Forwarded-Encrypted: i=1; AJvYcCWfsy76BvTKWvekztC0YpgH2XKZw4OnflsW9DD/9MXGmcrB4okF5gTb+Yvj6luERksSvaWTIcZZb4/H4qI=@vger.kernel.org, AJvYcCX8f60cpKNgzs5Gk6tojLiaTylXBDmnaui6EOgwyfmlBwV7qRqFEDor1Ks8578GSudB5eP+iK8Q9fo+gA3h@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbd4pfQJDIsN2gCGs0rikV4Oad07kc44Q7Bimv1C2e7qKsSj3w
	874YlixGpHheu03GNw8RdMMybMgl+a7hZ7JjEtb7TLmy3Ckv8lnzOA4kSQ==
X-Gm-Gg: ASbGncsKbZlSQEFlwKQqt6rzVjOjeO4lwtJiK2irSSXM3eEyeminxOlRr94xo6HdVFd
	/wXc5A2ol/DxrWmochUASNHurEcvWnXn4bLac3b7QbMhBmDguS0WlDPPTzD1LmInal0oyXUKFEi
	dAwJp0+lv6GO1iuO6aVkrJmqONYKbKO7HwPoAWP95TMuyu+WRgGTikusUexBdsAOG4Brv/GGWTx
	s128R3/56XrTf/ifpeWEULjLXHpjDiUl6S+OE/nn0Mei0NVZJHnwMSaJSAlQbXhwKo0rhlCKZg0
	WQURxcuYwg+DrOz+HOkBrG1GCcvavC1AYzuk9LVRjQgWJo5u0jkDPGGq5g==
X-Google-Smtp-Source: AGHT+IEVwKFsuS7CgmCIfZ5lJx9AYn7Fa9SQokf66YZ+o6y49rRT7QOKfh1HA93dX5vSRoOP4zosZA==
X-Received: by 2002:a17:903:3bc6:b0:220:d79f:60f1 with SMTP id d9443c01a7336-22a8a8ced77mr125504225ad.42.1743953027356;
        Sun, 06 Apr 2025 08:23:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785ada8asm64756845ad.52.2025.04.06.08.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 08:23:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 6 Apr 2025 08:23:45 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, Arnd Bergmann <arnd@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] script: modpost: require a MODULE_DESCRIPTION()
Message-ID: <2270bbd9-4f67-4c40-b0ef-6f7cc19a3c97@roeck-us.net>
References: <20250311-moddesc-error-v1-1-79adedf48d0e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311-moddesc-error-v1-1-79adedf48d0e@oss.qualcomm.com>

On Tue, Mar 11, 2025 at 12:49:02PM -0700, Jeff Johnson wrote:
> Since commit 1fffe7a34c89 ("script: modpost: emit a warning when the
> description is missing"), a module without a MODULE_DESCRIPTION() has
> resulted in a warning with make W=1. Since that time, all known
> instances of this issue have been fixed. Therefore, now make it an
> error if a MODULE_DESCRIPTION() is not present.
> 
> Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
> ---
> did my treewide cleanup for v6.11, Arnd had a few more stragglers that
> he was going to fix. I hope that by posting, some of the 0-day bots
> will pick it up and hopefully provide some feedback.
> 
> Note: I'm not really sure if *all* of these have been fixed. After I

ERROR: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-mgr-test.o
ERROR: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-bridge-test.o
ERROR: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-region-test.o

I am going to disable the affected code in my tests.

Guenter

