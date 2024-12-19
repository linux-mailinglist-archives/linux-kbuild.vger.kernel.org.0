Return-Path: <linux-kbuild+bounces-5181-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 954F69F7131
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2024 01:07:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE2EB16A428
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2024 00:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2C2923A0;
	Thu, 19 Dec 2024 00:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="xo/hrgDu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C061C1853;
	Thu, 19 Dec 2024 00:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734566817; cv=none; b=NQggJkegE/pDNl//qW9U2t1fRKuinME2f+9zv4uMAuaOuiWANzBFPT3IUITjkFtIyTOCkJl10YJw6SeGFxwBLR1rnLrhiTE9SNMdxfotpG5oa+m6KG2AeGN4NA/s5XtsWalYV81d0J33Aj8XpaR04BzghW/LKq9gr6SJavOJyCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734566817; c=relaxed/simple;
	bh=0m2UWsqp6DhW+fg6pzs7OuZdJ1zsemqrro/A/mgv/2o=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=DaIwKSynZUM1kDzHFOaNZdkcCncy/hC55Zm4AC2LzYpD8yoniiOzhLownVbCfQNN1epqmB1xl7jGHZDmSNoJ9ZoKwz75yCIchsDqNUm9OM7d7mP7M+JNbkM5PDi1ByVm62mC1zaYSGP/jtf9+xplB3DO5cY1HElSGiiPw9ERPes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=xo/hrgDu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9755C4CECD;
	Thu, 19 Dec 2024 00:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1734566817;
	bh=0m2UWsqp6DhW+fg6pzs7OuZdJ1zsemqrro/A/mgv/2o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=xo/hrgDugr2mkmiMBnbWJuamZR4pte/souk/iUW9GfPs8l0tzl0oDRGtESGSkI1zC
	 UuCRMOXniayF6uQHVBC3tnx3zis3HEw54oDEPuskTL79kkD3AtbCZXQRhPQHafJbgt
	 mtvOgwdnnNIRWcsjawqMMNrb8H8j/2n52tdSl4Yo=
Date: Wed, 18 Dec 2024 16:06:56 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Brendan Jackman <jackmanb@google.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Masahiro Yamada <masahiroy@kernel.org>, Nathan
 Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2 0/2] objtool: Add option to fail build on vmlinux
 warnings
Message-Id: <20241218160656.18cbdcbb93b0e0bcf28adf18@linux-foundation.org>
In-Reply-To: <20241218-objtool-strict-v2-0-a5297c961434@google.com>
References: <20241218-objtool-strict-v2-0-a5297c961434@google.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 18 Dec 2024 14:58:54 +0000 Brendan Jackman <jackmanb@google.com> wrote:

> This adds an option to objtool to exit with an error when it enounters
> warnings.

Why is it optional?  Can we always fail the build so stuff gets fixed?

