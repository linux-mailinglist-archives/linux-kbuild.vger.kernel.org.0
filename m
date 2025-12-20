Return-Path: <linux-kbuild+bounces-10297-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F29CD2D51
	for <lists+linux-kbuild@lfdr.de>; Sat, 20 Dec 2025 11:27:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5EA1130145B6
	for <lists+linux-kbuild@lfdr.de>; Sat, 20 Dec 2025 10:27:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6FD029E11B;
	Sat, 20 Dec 2025 10:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="T80q0LMc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nLOUhPdI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FB1273D84;
	Sat, 20 Dec 2025 10:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766226458; cv=none; b=DyPHyc/rLu19f0orPtUeK9Z7673MPAx3/jMjpNX9cEMeP+B0Js5zYyjn68faTbfQ5SiMYf7p/255477LBIuNJUyGGztwFyoCcSMTJeD9TDtN5CViDwsFb8ZzS/ApFYmiKc6+x9rR8D8LqV/zih+wCkOqYDaQOaKNJRLJDWYeZLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766226458; c=relaxed/simple;
	bh=4ayU5LOr7tNIL98U6NQ5cOcFW1WmT7m8t4BJrbjKzqk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=e930oDX+9qyUewnKDbds0US28++bSb02vq0WY7RK9sp7ehyusxsdFx12c3knxu8Itjc87Isrlyx5wIeYCFn+OP/pM6b6Iro6jgkEPq6Ezp580vRqwkvtYsavY1k6CNv/ZNW0KZW4l1BiN4lbWc8DOuZudprSW3h1WGj9Rx40d2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=T80q0LMc; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nLOUhPdI; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id DE4EF1D00099;
	Sat, 20 Dec 2025 05:27:34 -0500 (EST)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-04.internal (MEProxy); Sat, 20 Dec 2025 05:27:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1766226454;
	 x=1766312854; bh=0eqI3dSkqUuHn6eBrtKvp1Zgeyc9NvnaRzVUoIyv++w=; b=
	T80q0LMc1wLXS5JzIHNE0Pgg8QhoDgsBmigywbSxVs1J9LJOuKBwNvnHEp3NKp53
	sfjwhYTPhyKy8RCrsjN5w89J1kYsHPcHhY9+j/T/BHf6mJ5ws0KItmIuvgUTt/b6
	sn5DihHX9YXAYG+uCkCFLNVj4LaQ/FNIXCZT6iQuI+KtB4c1+iHV5XOGmKb/PuOs
	92hbpxFtKq8dwG+kDm5ZGRKAr7wrOnwW1qSDZvVtxHdKmu6sfuRAhkIqL4TK/DXg
	GouDRsZczWRdHHg3GU4UM0FJJmy1wtWJ9Fqho7SUBSNNW6ohq2smBjinbGZ65Hrj
	uP71FHRx/X/hIJ/LBd/8iw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1766226454; x=
	1766312854; bh=0eqI3dSkqUuHn6eBrtKvp1Zgeyc9NvnaRzVUoIyv++w=; b=n
	LOUhPdIWwOfnTzVArbr3K2hH1Z9yml4oTM171CkLztAUPSJmuV3hGXdj3iDWZEXM
	NQs/WWigmMhmMG9/vyIPvcPnlDRxXCRj+RGR6UTliPjc8DFEiHVD6AMgF6wtGd5C
	FGOi3DrnzDHiAspK9eHCkU3DfpCe3x2NeUotYoOGLvvtux7lU3NgnR3tiuqU2H8p
	6oVMPwCWmcP8EevNbZV/2OCaYTSY288qWsIWEbh909DAbWYEzh86TFH/eNH9jieI
	61RjWda6fJs715fD/T4in0d+lBYu5UcSkUJ4F6ZF6M5xVkKuf23Dztt/AkHjt93v
	6ZY8rkAJ5p8JGfGZ/FyIQ==
X-ME-Sender: <xms:FnpGaQTkIsm6FiiXgaeMgBUwoto6NttgG6KU30yZKS3-8YlV6jYDqQ>
    <xme:FnpGaYmB9YNyQNIgqNSDTGY5UxMqcCx6fGXrv7iNx5t5oxajjA4DLimehO0lpuwou
    qZ1tssfck_omg1-AY7PYUL0kbFXh2L-njbbkl0B7iouuQLLzfeT_ok>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdehtdelgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopegurghvihgurdhlrghighhhthdrlhhinhhugiesghhmrghilhdrtghomh
    dprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhs
    tgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgsuhhilhgusehvgh
    gvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehv
    ghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:FnpGabdz4EuQvBOhcQFwBe9q4bcTzXnQsI_hAAKIaLR2E1ZjgeSQLQ>
    <xmx:FnpGaaIIOFk1d4lcpdOn_QQW2seoir3GempMFiWtzbDYhymaFpX75w>
    <xmx:FnpGaQGBLhxNOplcVFwS7ooMRN1FhSF9eXWw3QuH3HkzOXAgOp-T4g>
    <xmx:FnpGadAUEYp7vDrZoX1dybHwt6qdbs1SdDeZfnEBF21VXFIl6vOCdA>
    <xmx:FnpGaargplzb75w-kyXEnOXx2i45NJ2qon8qadVr_ggAOEd-abjUSH2v>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 72AC7C40054; Sat, 20 Dec 2025 05:27:34 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AnL4ggAL8ANo
Date: Sat, 20 Dec 2025 11:27:13 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "David Laight" <david.laight.linux@gmail.com>,
 "Nathan Chancellor" <nathan@kernel.org>
Cc: "Nicolas Schier" <nsc@kernel.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <40f1457c-6e57-4d09-b50e-7133bafa7c3e@app.fastmail.com>
In-Reply-To: <20251219221827.4efa210c@pumpkin>
References: <20251214131528.3648-1-david.laight.linux@gmail.com>
 <20251219201231.GB1404453@ax162> <20251219221827.4efa210c@pumpkin>
Subject: Re: [PATCH 1/1] kbuild: Only enable
 -Wtautological-constant-out-of-range-compare for W=2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Dec 19, 2025, at 23:18, David Laight wrote:
> On Fri, 19 Dec 2025 13:12:31 -0700 Nathan Chancellor <nathan@kernel.org> wrote:
>
> Somewhere I got confused and must have looked at the wrong email (or just
> failed to separate two very long warning names).
> The actual warning was:
>
>>> drivers/gpu/drm/xe/xe_guc.c:639:19: error: converting the result of '<<' to a boolean always evaluates to true [-Werror,-Wtautological-constant-compare]  
>      639 |                 klvs[count++] = 
> PREP_GUC_KLV_TAG(OPT_IN_FEATURE_EXT_CAT_ERR_TYPE);

This does seem like a completely sensible warning to me, and it's
always been enabled by default. I see three patches in the git history
(all from Nathan), which all make sense as well.

> Inside FIELD_PREP_CONST(mask, val) there is (with the patch, and if I've
> typed it correctly):
> 	BUILD_BUG_ON_ZERO(!(mask) || (mask) & ((mask) + ((mask) & -(mask)))))
> to check the mask is non-zero and contiguous bits.

I think the problem is (as so often) the linux/bitfield.h headers
making things way too complicated. That condition makes no sense to
me, and neither would I expect a compiler to make sense of it either.

If there is no way to express those conditions more clearly, I would
prefer removing the BUILD_BUG_ON stuff from the bitfield.h header,
it keeps causing way more false positives than finding actual bugs
with the input.

     Arnd

