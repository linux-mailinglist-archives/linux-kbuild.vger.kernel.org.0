Return-Path: <linux-kbuild+bounces-2043-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A7C90188D
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Jun 2024 00:42:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B81C28117F
	for <lists+linux-kbuild@lfdr.de>; Sun,  9 Jun 2024 22:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 492A71CF8B;
	Sun,  9 Jun 2024 22:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="LOgUlPym"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29646208D7;
	Sun,  9 Jun 2024 22:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717972921; cv=none; b=HjuPRorh6GejnD2HGJ4a4nzik2/qYPx9vooFKMg34f1sM/5SbNC6FM0FrMK/qr69KGlRXQUYMfK103mDl1d1GLvmSYuIUyz5fVrnb6VAC6WUdODx5Px2mF42uAhx97BwIBXz1cfmN6iJBrQKMhbB8fPwMV7Lv8SSBJNORhKum9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717972921; c=relaxed/simple;
	bh=O3jcGf7YqV295x8XrhOprZJCgKIfIVQ0ONX7Lw+rFqA=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=F2TgLWRUbPwxobNw5bAb6qSAv5Ws5yQEL/+y0fl2oLySRQ6VYVVFKqTNzbzfvyK/WOKGex2ExYzHyfiSI4aKMfn1STmpY+Xrv55Qco6YbYlTp6yrpFguTknnSNgqD1A5+Ddg2em9wj+yf05DFOqVAvy7R6eqfVkR5joqaeWghzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=LOgUlPym; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1717972915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VOsJoUk1Idd/Aw5fa+RF0sYFGjSifEJG/O5labZ97qk=;
	b=LOgUlPymSEZ9fRe0Cu9TDi026UCo4RxldSonIbhxVmNI1TIddyYwGx/bgr3/Oy/QcknYDe
	UXxI0mGkgjlXQrrxPUQiCGmxecxCZN/EgeH1ZYJZyLNEoBYPTIPuLBqR242B3BoarGtvqc
	3a/Vyq01qEei8fVbuNciFBUTMvff8gnbCWsKD8BVQe+XchctQyOTS8GKh9r8qinoeLUAJ6
	j8dlXEnsVEZl44ZnFB2e7Xxprjvlonsf/l7kEIyhK5YlJEfztOZdO/YxZKeqbjGWhxiE+l
	i8LlWJR9G7zc/GJK0nnF/16Xrtlw1LU05SbA6d+44oZAHlucz8DiiJnhrqF/DA==
Date: Mon, 10 Jun 2024 00:41:54 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: linux-kbuild@vger.kernel.org
Cc: masahiroy@kernel.org, nathan@kernel.org, nicolas@fjasle.eu,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, didi.debian@cknow.org
Subject: Re: [PATCH] kbuild: Install dtb files as 0644 in Makefile.dtbinst
In-Reply-To: <ae087ef1715142f606ba6477ace3e4111972cf8b.1717961381.git.dsimic@manjaro.org>
References: <ae087ef1715142f606ba6477ace3e4111972cf8b.1717961381.git.dsimic@manjaro.org>
Message-ID: <10bef38ea944a42d591435e024f70326@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

+Cc: stable@vger.kernel.org
+Cc: didi.debian@cknow.org

On 2024-06-09 21:32, Dragan Simic wrote:
> The compiled dtb files aren't executable, so install them with 0644 as 
> their
> permission mode, instead of defaulting to 0755 as the mode.
> 
> Signed-off-by: Dragan Simic <dsimic@manjaro.org>

Actually, some Linux distributions, including Debian, [1][2] already 
include
fixes in their kernel package builds to change the file permissions to 
0644.
Thus, let's have this fix propagated into the stable kernels, to allow 
such
distributions to remove their downstream fixes.

Fixes: aefd80307a05 ("kbuild: refactor Makefile.dtbinst more")

[1] https://salsa.debian.org/kernel-team/linux/-/merge_requests/642
[2] https://salsa.debian.org/kernel-team/linux/-/merge_requests/749

> ---
>  scripts/Makefile.dtbinst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/Makefile.dtbinst b/scripts/Makefile.dtbinst
> index 67956f6496a5..9d920419a62c 100644
> --- a/scripts/Makefile.dtbinst
> +++ b/scripts/Makefile.dtbinst
> @@ -17,7 +17,7 @@ include $(srctree)/scripts/Kbuild.include
>  dst := $(INSTALL_DTBS_PATH)
> 
>  quiet_cmd_dtb_install = INSTALL $@
> -      cmd_dtb_install = install -D $< $@
> +      cmd_dtb_install = install -D -m 0644 $< $@
> 
>  $(dst)/%: $(obj)/%
>  	$(call cmd,dtb_install)

