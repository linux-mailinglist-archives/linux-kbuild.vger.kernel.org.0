Return-Path: <linux-kbuild+bounces-3073-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F16955933
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Aug 2024 19:46:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E70701C20BB2
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Aug 2024 17:46:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60FDE155C8C;
	Sat, 17 Aug 2024 17:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="Pi+1yIQl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC27614E2CC;
	Sat, 17 Aug 2024 17:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723916793; cv=none; b=Kmw1+8jBIo+uPcVlexug2s+Q7E2D5j69HE2IwcjGP9pOepazDK78ZKweaF3t7945FeaxWJGwSiSbdAfF9q1ZXHNHyp+JE7f25Afi376TTYa/iJDT2sHY7+YV8z9D9ruv9hBn06Z/FYxsb+vUtxl69/RdQqkQoIOmAaV2wGzJYwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723916793; c=relaxed/simple;
	bh=dfAIuA49d6maUVQ1eOJXieONkJENQ4XvD+5kCXqjNeU=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=JstV/u2r2nJ0973kBuLMLMjSHQAT0AKS73fYbN+LM/iIGIs48XhKIU4a4RGGd6Jb5t6CoNc6m/0bO67ODMUiVzPL+QSPuitYbaZPgdOr/+d9Ng0Omi9se8b0pvGio9rel+sFalgxxIrU2w8Y4U2vBDhcO9qe1Rs6qWOBsiiEA4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=Pi+1yIQl; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1723916787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/2fq2cJOoYCZ0qPJRLcrPAQ3+lG+SQLv/Ww2mQw2+t4=;
	b=Pi+1yIQl4TAVFM8NgdyWXo/AQ0ttpqRDorSM2EgCWDSVVl1zkisbfGa2ucnbVz+8nJCg8s
	/bVntQfY4i2xd41XSVufrQ1IbWtp0To98lVXkexaDWIqipLOsdCd62wpNNcZMVQ7JsZukP
	VzoR8cZGtpRlckIaAIniBTYDSZdeHIbNyLEn95tDQOfdpobdZTFqhev5TT3bHEiz7lfIDl
	F8wWzqbHS4EujjPhrsYs1J4Vhw37cxDQA9fIvc7XBk+3ECdSToH8P0uJjRYIzxzzSEdyrH
	wd9StlIT0xL76ou7Vnwbw61xlA1ZREekQWpDC2AGS5VjwPZAMyASvAyCWEyzJQ==
Date: Sat, 17 Aug 2024 19:46:25 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Ivan Orlov <ivan.orlov0322@gmail.com>
Cc: masahiroy@kernel.org, isak01@gmail.com, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] menuconfig: Allow sorting the entries alphabetically
In-Reply-To: <20240816141831.104085-1-ivan.orlov0322@gmail.com>
References: <20240816141831.104085-1-ivan.orlov0322@gmail.com>
Message-ID: <b7d45269e9d9438d3b1db293dc1482dd@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

Hello Ivan,

On 2024-08-16 16:18, Ivan Orlov wrote:
> Implement the functionality which allows to sort the Kconfig entries
> alphabetically if user decides to. It may help finding the desired 
> entry
> faster, so the user will spend less time looking through the list.

Awesome, I love this new feature!  Thank you for the patch.

> The sorting is done on the dialog_list elements in the 'dialog_menu'
> function, so on the option "representation" layer. The sorting could be
> enabled/disabled by pressing the '>' key. The labels are sorted in the
> following way:
> 
> 1. Put all entries into the array (from the linked list)
> 2. Sort them alphabetically using qsort and custom comparator
> 3. Restore the items linked list structure
> 
> I know that this modification includes the ugly heruistics for
> extracting the actual label text from "    [ ] Some-option"-like
> expressions (to be able to alphabetically compare the labels), and I
> would be happy to discuss alternative solutions.

