Return-Path: <linux-kbuild+bounces-6458-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC63A7CED4
	for <lists+linux-kbuild@lfdr.de>; Sun,  6 Apr 2025 17:59:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 324F63AFA40
	for <lists+linux-kbuild@lfdr.de>; Sun,  6 Apr 2025 15:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B69121CC48;
	Sun,  6 Apr 2025 15:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FLrWD2aE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7C93FC3;
	Sun,  6 Apr 2025 15:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743955161; cv=none; b=ub3ycA+B84FkQ2DrGPDWbqlYK0Llzxgk1I7WHNoF+w3sy95Zc+bv3GGQ875Bf8UmvJP0F0qFf0lT5mzwE4JOUddHRgluTFsFLvlD9vPX9EKvZboZxTNZqV2Dz51L7Yabg8wZ0kNBy2RvcJ3V9fDB6r2dG1qVynoqj4r5D5huhZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743955161; c=relaxed/simple;
	bh=p7FNo787wmdWK0dYQFYtd0NNEDAQgkVsmJTffyfBQcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E58w1gcTcpjvyZ1D8dMpVQIs5ej8uUSGrUDruxGtfATZfosIa+Kl7itZOFvZol0UNTy8cqkA9hX9gZP6+3n6Z8D6+YUWSvPSq3WifVCJSQamkl/qOyACYtp2aFKSehFPcjZFf3h4uFd62y6PydqGU66zp7TZhvAo3K6y9m8JrzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FLrWD2aE; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-736c062b1f5so2783210b3a.0;
        Sun, 06 Apr 2025 08:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743955156; x=1744559956; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sdipHH1BD46rTC0zXHndBFqdFD2ok+uSTvyM4V21lSw=;
        b=FLrWD2aEjnyNgVjzXjOMCTg81nh6CrKy1eOlupRLdFOdMJbxrv4A72ARnbD9v0rWGs
         CdYIS9IeN/5bd7P9aYcSf1njM9Jubbf+e5je0F2PMwjE28Ih6KGJMSNzTVCdG62atHo9
         HIaGSnUmzu2ij63jQ35N0Nsegv0eLzOKORbzW/ajutnTiabN+kOFMM+bYTMB1vxzWUw5
         i3za6VaPggyBKLtRf0AVKXHKNsBM5cIV1CmJfaiq7mPpK0JrTaGAU8cIHqflQkRH7K59
         Rp1LtkuzNErdkf8hNTxSExqhftrb5f7IZysk2DVoHpfoxaxH+bYGv52HvYBUjgFcqlxu
         lvdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743955156; x=1744559956;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sdipHH1BD46rTC0zXHndBFqdFD2ok+uSTvyM4V21lSw=;
        b=kiwM8bkDonrMSrOTeFEJXZEIhxrwvZ1m6NYbr3LOoCcml1MtIBf/izdbwFHxpkUvQt
         6PsI6tV0m/G34lY4j+vDqNjF1uCltuo2l8cxNHVHeGiwNSTu+r63yV/YmlpTJGq6jdhq
         0j1Ts2IhxzAooRRSY5eOdAt8tu5895JD+NmDMqDBlYfGu/gSsZ77D+iQHuAW8ieR6QxA
         tCh++5TI7j6/sfi02Riiq5qiYI4PnOzG8FUvibQa9JjFSmb9d3y2zRereHmMMAg6WegG
         y6br060W2mtnBk4nxNhcDAeLwYGIMdPNZl0i6i+pKDHdQf70JeYXnPvcuOOOVAhbw9B0
         s90Q==
X-Forwarded-Encrypted: i=1; AJvYcCXQr6B57QS7gzxLLFPLoYfdCqbnVyNxpTneoh0ExI8fDefTv7JIj1LlZuwTxbRFUM/i3amu1DB+/ZL1Jrds@vger.kernel.org, AJvYcCXjTBopmoVDTegNfq8g6NSJ+0MSuCXPtDvxpWYhBh90fkXe8Pjk+OKXXwW3J9JCKpNK5267lg7MDU5Z68o=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywffe85mlYGUHQOgzsP1JM/NZCWde2kU4VP8Z6HeLEiEjACbDhJ
	O/w3m2DEaz7e16V274dLE0vwJcDkoGWJdgja7b2kU8+2VjeBUCU6
X-Gm-Gg: ASbGnctvWh9rn13mWV6hiIJ99w6XoouuNGtHb3m6hKCQMwlCpKwlf3wD2wJLHfIR0Gk
	fxRQvqnB0szdVNePZ2uc7EOqMwHVcT+qEFciFWYBer2Ddsje4H7rhT1aCyPFLl5xwWR420IVfi0
	Wz40L2icqu8lDMnstWEFwTd09QpA2tLwIaSskvqWYre6oPaHA+cBbrxYbdWyhWiEF+Q6IabpOx0
	W7fFAaHGUMrv/GprR3OWpZ5zoY67WUGB1jCbWNjY8nKjGJqgwVVNwDu2ULDrU2E/oyl/8vFFok6
	/NvCA43Yyy0Hg8KZVHq/a1tuktHBe+E1vcAccG8wibSinkJ8wUc3YV14qA==
X-Google-Smtp-Source: AGHT+IG+hiHJFo5Ckx5oCZ+39YvTVATHnemCPM3vTnggjQ2tOcHpxLcKnwy++3pR0AuMqcfIq8W+nQ==
X-Received: by 2002:a05:6a21:3102:b0:1f5:80eb:846d with SMTP id adf61e73a8af0-20107efed2bmr13458815637.10.1743955155644;
        Sun, 06 Apr 2025 08:59:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-afe771b4bcfsm1073406a12.0.2025.04.06.08.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 08:59:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 6 Apr 2025 08:59:14 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, Arnd Bergmann <arnd@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] script: modpost: require a MODULE_DESCRIPTION()
Message-ID: <32b8f7fa-3c48-4f5f-b99b-c1a8cd065442@roeck-us.net>
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

FWIW, I ran

for f in $(find . -name '*.c'); do grep -q MODULE_LICENSE $f && (grep -q MODULE_DESCRIPTION $f || echo $f); done

That reports a large number of files (111, to be exact) with MODULE_LICENSE
but not MODULE_DESCRIPTION. I cross-checked a few, and found that many can
be built as module. The fall-out from this patch might be interesting.

Guenter

