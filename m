Return-Path: <linux-kbuild+bounces-7348-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4656ACB9C6
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Jun 2025 18:42:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF0DD3BD1BF
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Jun 2025 16:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D147223708;
	Mon,  2 Jun 2025 16:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="TppKBZLU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74312C3258
	for <linux-kbuild@vger.kernel.org>; Mon,  2 Jun 2025 16:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748882545; cv=none; b=CaRPGPcuMQ/opd/GjRFkRb124zhX8FJ1+FuMaT+zEznm0uKx0iGWLdqT7Lfe8gTS4vpAsBi1Od8/WJUGu5tk/w18o0jT8bDlkl0max5908MaDQBYPisFsy1qp6ZGUt3K/gLtCY1lql/atbxkH9OXlnuqs1dUunipfzB90RVZ3Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748882545; c=relaxed/simple;
	bh=Vd7FI6O5kICiS9vGTUB0qyLqgUOGEaiJ4PMlw1fw+uA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zgawn7Ugu++9SnfQm82cay51tVGN5Dxxr4CRgJOei104adKA0hcVTLAV6Qe8xNjqSjJoX0fo1dCvgSzVffQsP3ChSbVEdm9/hGVTkP2oiIPfIrSs8cWXOMRJRFeFB6pCC7wQtzFaedzvHEGw75lqqmQkgZFMWOII3H+mFPwUmDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=TppKBZLU; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=0aV+7hKzYhk2Xl4roWDwRCrpBPTL6WLMWZrKCiPNYrk=; b=TppKBZLUumYV8EKwFZ5rbJG6Ro
	PCPTYxEOwOhfzGMCg/8xnocLRMsJZXWidOBgVUA3aFyYf2PhwbWdBmiK9Yztmel63Ksizw2QXttoc
	wpDZcm1PRfkYKLfL+vRvcJ9A7syXGzAzSUodlR8xvqTR06Z+KEJCWGHF2xPJicl5n2T2RqnqDcu2P
	E7hsQXjSEIC8LLHjIu4jiEM4kHsMHpkyWFz/ulRuDSq1meZ+1+vZ7MLKDTL4OfaB1gWXcVdstuNrX
	5278tFfBzEUusPhlLZiOEIz+wN9V1Cdr7ayE2Y9HF7DfXIlMT/cMJvKsLkqN/sual/z+jnzv0Ph/X
	IWulJbGA==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM8Ev-0000000183l-2Djv;
	Mon, 02 Jun 2025 16:42:21 +0000
Message-ID: <897e8a0b-2d86-4c24-b4fd-6d3a3bb1e78a@infradead.org>
Date: Mon, 2 Jun 2025 09:42:19 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] Kconfig: Added compare capabilities for mconf
To: Franco Martelli <martellif67@gmail.com>, masahiroy@kernel.org
Cc: linux-kbuild@vger.kernel.org
References: <20250601184049.368419-1-martellif67@gmail.com>
 <20250601184049.368419-2-martellif67@gmail.com>
 <2e8cb14e-abb7-4850-a1fe-31bad55bb04b@infradead.org>
 <ddf7c0be-48ce-47d5-acc6-2e9e5aae64b4@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <ddf7c0be-48ce-47d5-acc6-2e9e5aae64b4@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/2/25 6:41 AM, Franco Martelli wrote:
> On 02/06/25 at 02:59, Randy Dunlap wrote:
>>
>>
>> On 6/1/25 11:40 AM, Franco Martelli wrote:
>>
>> Missing patch description/justification here.....
> 
> Have you run a specific "git" command or simply edited the patch body before sending?
> 

I just edited the patch body.

-- 
~Randy


