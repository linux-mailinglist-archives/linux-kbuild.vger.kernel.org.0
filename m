Return-Path: <linux-kbuild+bounces-7761-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F309BAED287
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 04:52:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 355E918910BD
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 02:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EBC117A2E1;
	Mon, 30 Jun 2025 02:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="rDPGpGm0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7ED129D05;
	Mon, 30 Jun 2025 02:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751251925; cv=none; b=Q7G/Mafh3urfIVeWUuiZafyqWN27ey7ofzsP4WeKLaFWn5SlIr3GMUaszFPj22U14rVB4EUlFiX0NKxW9QewnLw/bQBfVY/55k7RHSaPH0U6leHb71uf186ke0xzVyjRFGYZ2COEvNmeMwIxbf2vzYBuwBitg8qkcpK0x1eNCF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751251925; c=relaxed/simple;
	bh=JmR/xwrfBDRIhBXPAYCDpQbknu2o6PO4Kqp/MQ0QjRI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SmRRbTIAdsiV3E0YaJbYknErU1uv68zRPrC+lIyoRBFGnmAEiUyOIu0c96pj2tx6VeKiw0LfF/VsmY3AzxcjrrqHFlQdh4S3VJ3k5XnZA4M+CeDSFoqGXYkjXFAbj5RHO6C4S6EnRrGCrrKrkzsm/ZFz5b4x+ou5YtewFRbppOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=rDPGpGm0; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=hVDm8hx/EHxjqjtTOyjCG/Vc9mqLc1dzrsjrbOWiCxk=; b=rDPGpGm03rob5lTBPuklGUvp7z
	nQ/qxoFaDcgOhzJD1GbBQvUJspwXQ4nutgwets7Ht2FygW0CCwaBHudpQsVDYfL2qhd2PJex9yejl
	Evd8d2GHskAd04Gu4lklQSuMpP1xFnrR5u4+COXl2E80qHobqNA6SMczqweirW87MNNGcj2LYqQC0
	YE4OpuKiiT2d3dLflukY3YGcQdOd/B+4dy9VxF4aJQQukoM/BWY6l2M2iqD3y/YvlCpSpsDlByxYH
	pALy5IuM/N1Fwiht7fzGYHFI8IGwiPbBMYtNVl48Tf/NPrR0cTsnfO0Jp6ik9MYNGCAlmM5gnoJxT
	QZiJ1pJQ==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW4cf-00000006iNC-3fcK;
	Mon, 30 Jun 2025 02:52:00 +0000
Message-ID: <b2a733d8-e95c-4f40-b48c-04adf0b5dba9@infradead.org>
Date: Sun, 29 Jun 2025 19:51:56 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 25/66] kconfig: gconf: refactor view setting code
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20250624150645.1107002-1-masahiroy@kernel.org>
 <20250624150645.1107002-26-masahiroy@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250624150645.1107002-26-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/24/25 8:05 AM, Masahiro Yamada wrote:
> Factor out common code for setting the view into a new function,
> set_view_mode().
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Nice cleanup.

Acked-by: Randy Dunlap <rdunlap@infradead.org>


> ---
> 
>  scripts/kconfig/gconf.c | 74 +++++++++++++++++++++--------------------
>  1 file changed, 38 insertions(+), 36 deletions(-)

-- 
~Randy

