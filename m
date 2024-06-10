Return-Path: <linux-kbuild+bounces-2045-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82857901A1A
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Jun 2024 06:57:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5730D1C20D3D
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Jun 2024 04:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D2A51C20;
	Mon, 10 Jun 2024 04:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="lfvMrCyv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE5C1876;
	Mon, 10 Jun 2024 04:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717995438; cv=none; b=jaJpBzF9PadsdRmRIfe4AfV3P/A01wRFH3CugCa4cNMVe9PH+prJLA5AxyTUQ+JcLLqzIEqrJ5IGXzsiQ5390feVO6Li4fjqrIYniXKOV5dW3ZYl1rBG6W94vHitPBMlRDVHbrlWuj+Aq781DalyP25b7+TTZQKt+ugKB8/rY2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717995438; c=relaxed/simple;
	bh=wxbsFRAyMPxGwLJXkgt4cKJcpKNji7+5eJtx13k7bqg=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=BCCmhw6s2NeyM2o5yt0jdrE2LAfznYZ4V1w69NkKYJF+kiQSCmYNdpnAETgHrfgtab+IpMEP58Y0GsIzl2ysqYq6iqdZmCVdg0nBQny/oltjM4lSjUf715Z926QB9ckDyFB36Y3Z0YiJ0Iecj30njS+e74sLzaZ9BuvGksgcRsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=lfvMrCyv; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1717995431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kwNy3d3Jg8/1FZKgpltuZABE30M9Y26J8cmhqW/3dP8=;
	b=lfvMrCyvKdI95zE4xxfMvH2LwRMiC4U827eLfkLsv4dNMcUYLK1oJXyXgbz37ljfHJcxXV
	cLNkpU4nz4UF5RjqLSpAQPvIb6op7SM3sexmAegtKMsErYtjiphC0Rgbso+Qn6z0X4PWFu
	05igy7HFO4LOSMhfZl/O+2ecJVF3lpY/W6q6EkXNsOtPfq9ixub77QPaBZMdwdbn/NlNxI
	DF6V5ZumYkJhsrXQ/qDiBcKcHhCn+7KmhoPDz9YPYlGgvly+HbO2uxFH0aucHVkslg2tm2
	3Pxi35454ri6S2TXnyN51DtDyWEotkwjqh49/XB7vGDVgpH/IismzBNqHTycwQ==
Date: Mon, 10 Jun 2024 06:57:11 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-kbuild@vger.kernel.org, masahiroy@kernel.org, nathan@kernel.org,
 nicolas@fjasle.eu, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 didi.debian@cknow.org
Subject: Re: [PATCH] kbuild: Install dtb files as 0644 in Makefile.dtbinst
In-Reply-To: <2024061006-ladylike-paving-a36b@gregkh>
References: <ae087ef1715142f606ba6477ace3e4111972cf8b.1717961381.git.dsimic@manjaro.org>
 <10bef38ea944a42d591435e024f70326@manjaro.org>
 <2024061006-ladylike-paving-a36b@gregkh>
Message-ID: <241d73701043d642dbabfe1c7219009a@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

Hello Greg K-H,

On 2024-06-10 06:19, Greg KH wrote:
> On Mon, Jun 10, 2024 at 12:41:54AM +0200, Dragan Simic wrote:
>> +Cc: stable@vger.kernel.org
>> +Cc: didi.debian@cknow.org
>> 
>> On 2024-06-09 21:32, Dragan Simic wrote:
>> > The compiled dtb files aren't executable, so install them with 0644 as
>> > their
>> > permission mode, instead of defaulting to 0755 as the mode.
>> >
>> > Signed-off-by: Dragan Simic <dsimic@manjaro.org>
>> 
>> Actually, some Linux distributions, including Debian, [1][2] already 
>> include
>> fixes in their kernel package builds to change the file permissions to 
>> 0644.
>> Thus, let's have this fix propagated into the stable kernels, to allow 
>> such
>> distributions to remove their downstream fixes.
>> 
>> Fixes: aefd80307a05 ("kbuild: refactor Makefile.dtbinst more")
>> 
>> [1] https://salsa.debian.org/kernel-team/linux/-/merge_requests/642
>> [2] https://salsa.debian.org/kernel-team/linux/-/merge_requests/749
> 
> 
> <formletter>
> 
> This is not the correct way to submit patches for inclusion in the
> stable kernel tree.  Please read:
>     
> https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
> for how to do this properly.
> 
> </formletter>

Thanks for your response.  I'll send the v2 with, hopefully, all patch
submission issues addressed.

