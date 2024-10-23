Return-Path: <linux-kbuild+bounces-4279-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC179AD144
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 18:45:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0D761F21FA6
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 16:45:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD4D81C9DFE;
	Wed, 23 Oct 2024 16:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hV/r9/Yi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8E562171;
	Wed, 23 Oct 2024 16:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729701938; cv=none; b=t2RFNRJtPXokReZSPT1rDMPGnWKFANfbSefBxXHnuncOgm+g0xNIVS75SvItKtYrSMnEkjCOLTT3LSuwKSVcldAU08IfM3+jOSdEFpdzGgKGdUr7o4SKncktcZkmuIqPBgUmgizRwRbpEf+8VAXjo4mEksKtVrGrDWiudXTlKBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729701938; c=relaxed/simple;
	bh=h2JGt3X85RKRDd+2EPZCOOa0tCWEzPOqh4KtmSrD0FQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K8uV8Qrm2VlDLxCSgywq7JPJD36s9sSN7qO0iINCEXGt6XLu+4EZMPECTfSfr8hxbDc5bWvZev7dKpewfUzNhVrPvco2xRRbvljbqxezGSJReg0bPKHxwhW0vLldq5s1B6jqNYwJhHv2fKCg8hXiFwTcnHuMyfcRAGdBQkKU8Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hV/r9/Yi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A7E1C4CEC6;
	Wed, 23 Oct 2024 16:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729701938;
	bh=h2JGt3X85RKRDd+2EPZCOOa0tCWEzPOqh4KtmSrD0FQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hV/r9/YiiI4qTILfEQ+C08Cj9/4fYvKdSDzs0Hdc5fBqdXA1XzQLSFQtrEpCi1u9m
	 eewab48qnqN5DGhARrtUISJA728PQNwZeRqW3F0kTrWrpx945i3+1rDXcjl45HzPjE
	 gQ+fP73bFIo/8qj9INjBnc3P+NrY1RNT8H2FKgYJy3/xOdPZe2C31JluXCpyP3vHac
	 9UFJef1m41k+07dFmkZh+39JDW0T/W8F1Gh/TDb9LIQ/p01FSMnOSTZJ8xSnnNFpon
	 zlN3SkTlc4QIzRSooNY/LQ7BHZKyiNBxkCw17l6J4kQ9cZhYVEeSjDFokl8zvTNjv0
	 R0BNcitvJd1jA==
Date: Wed, 23 Oct 2024 09:45:35 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Koakuma <koachan@protonmail.com>, Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"David S. Miller" <davem@davemloft.net>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, glaubitz@physik.fu-berlin.de,
	Nicolas Schier <nicolas@fjasle.eu>, sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2 0/2] sparc/build: Rework CFLAGS for clang compatibility
Message-ID: <20241023164535.GB4081497@thelio-3990X>
References: <20240717-sparc-cflags-v2-0-259407e6eb5f@protonmail.com>
 <20241021201657.GA898643@thelio-3990X>
 <CAK7LNASTkUTK8JZCzySNh3BVKxauusVKRhjnchy6iZz4qLbq8w@mail.gmail.com>
 <20241022200732.GA487584@thelio-3990X>
 <etezvjy_HnDpgOTBrzap29if1ChFBhl1RawcNJK3UAsFk6i_g_cyHoz7hlqfYqASgJZ97W4HxnGA-nbCXL73pIRN9tUKUttAp1JefMRp8rs=@protonmail.com>
 <CAK7LNASbFeJc9Y=BFY85SwESUKNNDTRDunyLGveDusC--NVkCw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNASbFeJc9Y=BFY85SwESUKNNDTRDunyLGveDusC--NVkCw@mail.gmail.com>

On Wed, Oct 23, 2024 at 12:38:59PM +0900, Masahiro Yamada wrote:
> On Wed, Oct 23, 2024 at 9:44 AM Koakuma <koachan@protonmail.com> wrote:
> > I'm not sure if I should update the documentation now given that LLVM support
> > is nowhere near as complete as other architectures, but I'll do it if needed...
> 
> Nathan said he was able to build the kernel.
> 
> If so, I think this should be documented (required LLVM version and
> the supported build command),
> otherwise people cannot test this patch.

I am not sure that there is a super concise way to describe for
Documentation/kbuild/llvm.rst that sparc currently requires 'CC=clang
LLVM_IAS=0' along with a build of clang from the main branch of
llvm-project to work properly. I worry that adding any sort of mention
of sparc in there will have people flooding to try older versions of
clang like you did or LLVM=1 when there are obviously known issues that
the upstream LLVM folks have not had a chance to tackle (but maybe it
will be good to get issues on file for those).

If it would be useful, I could send a separate email documenting exactly
what was tested and how it was tested as a reference in the face of
future changes, until better support for the LLVM tools is enacted.

Cheers,
Nathan

