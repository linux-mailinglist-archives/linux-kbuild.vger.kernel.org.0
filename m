Return-Path: <linux-kbuild+bounces-5581-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA1FA24157
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 Jan 2025 17:58:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3B38188321B
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 Jan 2025 16:58:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67CB81E570E;
	Fri, 31 Jan 2025 16:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jDnvnTY4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-176.mta0.migadu.com (out-176.mta0.migadu.com [91.218.175.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D502563
	for <linux-kbuild@vger.kernel.org>; Fri, 31 Jan 2025 16:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738342716; cv=none; b=kS5IwGdVJqM/2jCYMkc3Inb2WIMkGyZsoBGhemc5oijdHRUyr2+7QJSSYAGloi5p+LhT7fTNMLk/Xnt6BIympkP+S/Uk8RZpoymiETIHth8jfSluCLTRBOXmjYkjDnsNpVM4UnWjSwonFseMnXDmKBZFhuTUKkDAHuQhVJNvw3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738342716; c=relaxed/simple;
	bh=xOJb1xRsrhAC+IlZ+UD5XxQ4SDRFfH/5tAWUx5IVt9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WVrc0EhBrHba6Btpl1RKEseALNVAdxDg5QWxfz/vOhsnbbOgIC6ASbub9haAAfdANlSwMMA8cy3Vg5Wu6oVmz8xQbIQfL6MPoBxmnFu506Nx2Z4KFEqf8kRvqeVsGxVLq2RRhdB5SWoZJOe3kxc5skJ+24OOVtX8ty10vzMoVE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jDnvnTY4; arc=none smtp.client-ip=91.218.175.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <f8759dae-ec1c-4f3c-a44a-dbd22d7964e4@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738342707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xOJb1xRsrhAC+IlZ+UD5XxQ4SDRFfH/5tAWUx5IVt9A=;
	b=jDnvnTY46CIUzdJJg/Y1TaH+JgUZpovG+TiVEW2nij2uF91ccg3wxv/M0Bi1wJWrFgm/Zi
	IqAKmfTgZngUVUcVZm6Hx8P6oosWIiZ53dE1w0a3xHRaKX/+VmuVvivoQRtkMzeFZ+BWun
	JO22xSkdydzNTOKqz0X3Ovbf4cc0hvM=
Date: Fri, 31 Jan 2025 08:58:21 -0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] kbuild: fix Clang LTO with CONFIG_OBJTOOL=n
Content-Language: en-GB
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Nicolas Schier <nicolas@fjasle.eu>, llvm@lists.linux.dev
References: <20250131140407.1392008-1-masahiroy@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <20250131140407.1392008-1-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT




On 1/31/25 6:04 AM, Masahiro Yamada wrote:
> Since commit bede169618c6 ("kbuild: enable objtool for *.mod.o and
> additional kernel objects"), Clang LTO builds do not perform any
> optimizations when CONFIG_OBJTOOL is disable (e.g., for ARCH=arm64).
> This is because every LLVM bitcode file is immediately converted to
> ELF format before the object files are linked together.
>
> This commit fixes the breakage.
>
> Fixes: bede169618c6 ("kbuild: enable objtool for *.mod.o and additional kernel objects")
> Reported-by: Yonghong Song <yonghong.song@linux.dev>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks for the fix!

I tested x86_64 and arm64 for with and without lto, everything works fine. So

Tested-by: Yonghong Song <yonghong.song@linux.dev>


