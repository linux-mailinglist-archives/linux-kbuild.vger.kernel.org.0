Return-Path: <linux-kbuild+bounces-6875-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EF61EAA74D9
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 16:25:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 937CDA004E7
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 14:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FE132561CE;
	Fri,  2 May 2025 14:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="kp08Dnjx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6E2F9E6;
	Fri,  2 May 2025 14:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746195908; cv=none; b=jT+gHsYXGEu0ZLYkvqlnDyGFWFBg82AoB4xglAuAYtY56eKS2Np9rZEg9dq3ScdXSac6kjCaneFrF0Y8ILzrP8lpStXEDTh+5f0tE//JX1u/HCDxHT6iauT0LDrYgfiUycsZsK3IS8dV/JWRp1TIAOlG8KKngokOUI5l5ms5Yck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746195908; c=relaxed/simple;
	bh=WvF+xWp2xlZ2zs8LakLzsgpePI0MDRjpdxZLuzR9pzs=;
	h=Message-ID:Date:From:To:Cc:Subject; b=WaaOE95t6vQFxOSTVlV7oArItr8PViy+GBmYX4vJjww6iiU+W56ake1y9pbsFCxWFHTrmsgAg7KhUMsNASVPoe5xKqhacTJ89jotuKcsdauq6K9Dzf65+PP7ry5MdWnNdxgCJ1ilanidLBfYyOa9azIEDrluOzTgVSc8oRzoPkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=kp08Dnjx; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Subject:Cc:To:From:Date:Message-ID:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=WvF+xWp2xlZ2zs8LakLzsgpePI0MDRjpdxZLuzR9pzs=; b=kp08DnjxaLIz8dw101vclixb/1
	njEFfQLsoASr9dvC2srab8e+AyvpeEdS0vgwtyo+hyxZNoy18YA2R+1ZEkSQjltUc9wl/JPnFdwYJ
	XHwsWLDsp1G7FLaTQXjToV+vufgxxLWwJjoLXI2UhCeJixLoAh6rKcLRjxCpIC8wXbG/XXEJa5hVK
	/iGk9oE0dgVgHQLBxauz1mlgFb2YmGQoSHnWFeaL72RZPvBSQJKfmrejbkoe09Tidqc6XT257Ow7O
	pWOfgG/9Usp7NX92hLj+dyAapRHqqyn51SKYYysLTynD3l1oE12ZkRDUcGgqTx2Rzz2dSKuP9jEdZ
	fak0AnFQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uArK1-0000000EzDc-12xj;
	Fri, 02 May 2025 14:25:01 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id E0F7F30057C; Fri,  2 May 2025 16:24:59 +0200 (CEST)
Message-ID: <20250502141204.500293812@infradead.org>
User-Agent: quilt/0.66
Date: Fri, 02 May 2025 16:12:04 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: mcgrof@kernel.org
Cc: x86@kernel.org,
 hpa@zytor.com,
 petr.pavlu@suse.com,
 samitolvanen@google.com,
 da.gomez@samsung.com,
 masahiroy@kernel.org,
 nathan@kernel.org,
 nicolas@fjasle.eu,
 linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org,
 linux-kbuild@vger.kernel.org,
 hch@infradead.org,
 gregkh@linuxfoundation.org,
 roypat@amazon.co.uk
Subject: [PATCH v3 0/5] module: Strict per-modname namespaces
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

Hi!

Implement means for exports to be available to an explicit list of named
modules. By explicitly limiting the usage of certain exports, the abuse
potential/risk is greatly reduced.

Changes since v2:

 - switch to "module:" prefix (Masahiro)
 - removed some patch noise (Masahiro)
 - strstarts() and strlen() usage for prefixes (Masahiro)
 - simpler ___EXPORT_SYMBOL() changes (Masahiro)

Not making using of glob_match() / fnmatch(); this would result in more
complicated code for very little gain.


