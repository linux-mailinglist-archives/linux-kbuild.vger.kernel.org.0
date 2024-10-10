Return-Path: <linux-kbuild+bounces-4048-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB951999395
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Oct 2024 22:21:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C5FCB24648
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Oct 2024 20:21:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 829EE1D0E10;
	Thu, 10 Oct 2024 20:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dsUf9BuF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1821CF2B3
	for <linux-kbuild@vger.kernel.org>; Thu, 10 Oct 2024 20:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728591663; cv=none; b=PcCnO76Kf2uYQm7hv2kLmhrn/CEn20Zq4nFpzjnvGe1uEJ9UHl3/SvytTTsed3pgyVsAQAYjgDM8sirlXsmeZYjfJQtohwT0Zi5JgU4zb6xuOTuVPz0D2gdawmUA0S1lfWuWM/xKfwiJhdEKXAKTsz9Eej7xx33GH/Q5IeqkY58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728591663; c=relaxed/simple;
	bh=9WfALPVOfJZ/mFKzAYvK//SVHWXbd2ywhl9rOI2AlWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JYt4eYyK2YhqRvr/w4dDZvWxWBgTAwtwPVSq+3PmjgyUv7WjqNH8u70yX3bjhy7X1uS8RvEUVNJA/GHDVeFiAIQS5ZvvUOibWjJZM93f0koBfYT5aNpA9lpjpOL2L2TeHGvX0kGX43Sxrjnzsh2ZWXiCkJPC9wCfXiG049lerBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dsUf9BuF; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20b061b7299so14645ad.1
        for <linux-kbuild@vger.kernel.org>; Thu, 10 Oct 2024 13:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728591661; x=1729196461; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bsUUagQLMxpsg1s3OtRahk2ocs42xsdekbZ732TOaq8=;
        b=dsUf9BuFcSsYeos/nki1nnFVFdR8of4ZjQmbpGgLnCBnfmwVGSriyI6MTPR2avwDye
         P4tPgjL+sxPxy7ea++gkmnvI1LlJXJ19s/4T5zUuGs99C/NAHQzjH/RfZ8MFSVcmmxSW
         OEvpWweyW4++6D/VRmcLJg7ZXw9jqPX1mbx5n7kptOZd6yWGJbF/A5sTDgEqSMVbmrf0
         uy3Q3MHgEvPuV/Q01N3ZX3Y3AwhoRpOlfM65DIiXo5aqb+DoEUz6e1IOnudd0EpiAC1Y
         CdmjeXS6SYQ3dGpcsm+uzWGV3DaiF+A0UAb1BK78IrnnD9FQAMPL3098iy1NQ8jV8A+M
         cubQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728591661; x=1729196461;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bsUUagQLMxpsg1s3OtRahk2ocs42xsdekbZ732TOaq8=;
        b=EC1LhUZZp96l7TunZrFjbncNZn0ua5FdjB+AL8O5uY/wsmru5Gxm0ql/8zdLK++eJ5
         ICzFDhWOI7C0HvSXUSKNJAu0H7TFgcmIN/6NDwJbAFmSOTiE1Z8/4fmyvApiUEInsN1E
         o31+ZYhFknB0d0AI+Dsvjam85Wm6J11JQWqSQJMkBLTCgQJJoRbAE8lXL0VrF6D+7xds
         H0Qkm8jsFKLdMCxVd121TfazpTyNVIr4J0lxPh70I/nQjy0J9i85Q4UFvyPOV0vwk1Pz
         15VcmeAyiFJiNRM4LUlun69S8C5CnMqoucVglwUz70H/cjs7p84GH5I/Hy75dSblodvg
         5Sbw==
X-Forwarded-Encrypted: i=1; AJvYcCXjdKqKcZzxWsQkdQ+d0wySlvTNefl4wbpZkp7RWukFtkdvZ1p3deF6CsyZNzwjwCCOn0VeFL63qVXjg9w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOQYzlNwdW7hDkrMth8gZy1vKQ3syrnWbERENV0CzRcy+EtTuz
	1nBmtdKRQvXDCSOCQ/eC4TKTY4g/ptvCaS/f+U00cg7lbaaVkFLkYKpBjPF01g==
X-Google-Smtp-Source: AGHT+IGX1gGCNGtPua6Jc81nhJD2bm6jRchIK8UyVGA97X9p4VXx4bjHZm0n+42YHrQKT4AF6r5IpQ==
X-Received: by 2002:a17:903:248:b0:20c:7409:bcda with SMTP id d9443c01a7336-20c9ee81b5emr668245ad.14.1728591660965;
        Thu, 10 Oct 2024 13:21:00 -0700 (PDT)
Received: from google.com (254.80.82.34.bc.googleusercontent.com. [34.82.80.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2d5f0a3f4sm1779389a91.29.2024.10.10.13.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 13:21:00 -0700 (PDT)
Date: Thu, 10 Oct 2024 20:20:56 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH 2/2] cfi: fix conditions for
 HAVE_CFI_ICALL_NORMALIZE_INTEGERS
Message-ID: <20241010202056.GA845212@google.com>
References: <20241010-icall-detect-vers-v1-0-8f114956aa88@google.com>
 <20241010-icall-detect-vers-v1-2-8f114956aa88@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010-icall-detect-vers-v1-2-8f114956aa88@google.com>

On Thu, Oct 10, 2024 at 09:38:27AM +0000, Alice Ryhl wrote:
> The HAVE_CFI_ICALL_NORMALIZE_INTEGERS option has some tricky conditions
> when KASAN or GCOV are turned on, as in that case we need some clang and
> rustc fixes [1][2] to avoid boot failures. The intent with the current
> setup is that you should be able to override the check and turn on the
> option if your clang/rustc has the fix. However, this override does not
> work in practice. Thus, use the new RUSTC_LLVM_VERSION to correctly
> implement the check for whether the fix is available.
> 
> Additionally, remove KASAN_HW_TAGS from the list of incompatible
> options. The CFI_ICALL_NORMALIZE_INTEGERS option is incompatible with
> KASAN because LLVM will emit some constructors when using KASAN that are
> assigned incorrect CFI tags. These constructors are emitted due to use
> of -fsanitize=kernel-address or -fsanitize=kernel-hwaddress that are
> respectively passed when KASAN_GENERIC or KASAN_SW_TAGS are enabled.
> However, the KASAN_HW_TAGS option relies on hardware support for MTE
> instead and does not pass either flag. (Note also that KASAN_HW_TAGS
> does not `select CONSTRUCTORS`.)
> 
> Link: https://github.com/llvm/llvm-project/pull/104826 [1]
> Link: https://github.com/rust-lang/rust/pull/129373 [2]
> Fixes: 4c66f8307ac0 ("cfi: encode cfi normalized integers + kasan/gcov bug in Kconfig")
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

This looks correct to me. Checking the LLVM version is definitely a
better option. Thanks!

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami

