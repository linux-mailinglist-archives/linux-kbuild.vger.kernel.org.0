Return-Path: <linux-kbuild+bounces-13133-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sF62Jv2SBGrCLgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13133-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 May 2026 17:04:29 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16318535B10
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 May 2026 17:04:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ADB0832ADE35
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 May 2026 13:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1822E2D3739;
	Wed, 13 May 2026 13:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tut49SjM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2222D876B
	for <linux-kbuild@vger.kernel.org>; Wed, 13 May 2026 13:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778680782; cv=none; b=CLLaJ8uGimvWLzQkcFFiFpzkxWooC/jYS19Bd3fV5Oxpv/6rgelLULENlV6map6/bn07n137Tzsq6kKvz3Ioh6vwOQHQnGspWSJa4YS53vEno6iDfXjH2uHw3FCNXZaPwjmpecNp8BYFFASZG8TYtT8mobni88dLLzafW+j2jMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778680782; c=relaxed/simple;
	bh=WkNnHaheJ5ggjAEfjUtSR2NL0BoAilq/XapW6CyXmwI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=QHKCgYqkPyIP/861vsK72tlwrmS6cvLuda0BXT8Gq1yWNCjte/CkRU9h+xh5ZYniREgOYg80xGLznF803+Wf4y0fuiMn7yqzncUUtAUnOupViSrb3k+Vvow6jBJcLNSMI3+IcuwAVH0pksEstzaCDhidUUJsz907NrlhnCRzdBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tut49SjM; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43fe3e22e33so4141137f8f.0
        for <linux-kbuild@vger.kernel.org>; Wed, 13 May 2026 06:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778680779; x=1779285579; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NsFc3nYv1Tw4//qtRhqmTwmES9zr3g4CbXHYTHnJEHI=;
        b=Tut49SjMwT8eSX72cK7FRC6PvzB/JTy0PwtU3cxWrkHwFa4Hikw66yWiM2Q9nKxzVh
         YOMDn7xNTRv7mPMKwdpvG6/f+7vnPeaxxixQ6NYUxECp7BinQ5v4Ah+Ec2jV+MhIUtGk
         6j8+7DrNyq/ysz3EiOXj3ts9S9voEWd4IIB7nWFJw9Liat9UDFKlr2hbvRM6Gdw5isXI
         1jy3fR9hi9vYD8C7muNNfKiJxcRtyHNaasR6MrCHxTOrydoKA42GoyzEAJxm8MM4WzVb
         Q5QKBwnPN7qg3IV1iSZAswOct3wAMnKIpajbqDc0pcT7NwcQ/1qPR2pb9cwGIcbU0A3d
         5A6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778680779; x=1779285579;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NsFc3nYv1Tw4//qtRhqmTwmES9zr3g4CbXHYTHnJEHI=;
        b=FaiF9/bIJvCAR7fGfodTXHLbld6eoxF2NNQn5/yKIXHtI5qijUMjtLm2XhSPMuDDQ8
         Cbci2f3dxkNLcv60y+e7U8JN03jBS1FVA/BrfuXr+GP1TZd7yT4+4ZJD/qcYmVaydpgf
         ET29+sZer7GnHVJScIUayatJDFy6ndNnhzOXXfD5mHp9pm9ISMes0DRWBS52fLhdExvM
         fpOWhcYtWfozgEU+5oaztDmgshRO+RVBP8rktRDO58ts04hSXAjnqdxdfghhoHWhDPuU
         8FmOCHGjRekJ0olyhAWwRHHVpC2Lk6EuTlAzhHXfA7es+uyZoGdVGmfA/Oz06a9g1+GJ
         vLpg==
X-Forwarded-Encrypted: i=1; AFNElJ9BeC15G7HWicTQ0FW/qe7TZcCpzKZm48Ak/eCyfEnyGyS4u3O86t+0fLPi3qpVEAKzG/KwET/skBtpvE0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk2swspNvHaDdC8tV2jsVij4Tbx469v/EDaZjYAAXkWRU7fElq
	HNFodV1FQoMjrtLFOodKdA9ZAoJW+1mt6v2pnk3IJvRQbsvAGraYn7pY
X-Gm-Gg: Acq92OGhd+2Tf7HBjjSYPIj22WWXwtJzVE9iXQxJk0lYJr8YV0ln129nj0TdxgiKtJY
	vr744zIH+MlTIzvc0Vv17RM3igOYjxzaytmQv72veoSYFuyw1KLH0pz07boyO7ruUdRmQhirN83
	h9K/LTxP1b8tv4JSCTvwNjClF8PflgUdB2nyNTKjNyO7djwV2aqG/kxCtIR+9VkzsGyB24Hk0iN
	sVOLss/zkEg0HqdmBv87gzMAmXCT7u51HGb7OfPA+INL83WUN7pHG5dPun7AapH8tk7O31Az1G1
	ntUgVnL+jj4O2HVFm1+HWm/J15dKkR+OgXKgQSenyCoHDiQbGEEdMHqrzyPO8xBNDidKyy1EHwz
	EWM7jA7qwnGcqbJL6sK3Maefyu4EBIB/RxCsopQdyJWGbmXdzzvlhqc4a/rkWL20Hd9WqpV7zPZ
	gM7Av8ZbAatXj7HF1mkqXZ3xIDQjr/fLHeQoO11CUypqttm1jCmxwPbkK8z/Y=
X-Received: by 2002:a05:600c:a011:b0:48a:563c:c8c0 with SMTP id 5b1f17b1804b1-48fc9a0e65emr53080375e9.7.1778680778790;
        Wed, 13 May 2026 06:59:38 -0700 (PDT)
Received: from [10.128.10.158] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f442129sm42770485e9.28.2026.05.13.06.59.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 06:59:36 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <bc46423d-54aa-4773-bcad-e1c125086812@gmail.com>
Date: Wed, 13 May 2026 14:59:35 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Julian Braha <julianbraha@gmail.com>
Subject: Re: [RFC v2 0/2] add kconfirm
To: Demi Marie Obenour <demiobenour@gmail.com>, nathan@kernel.org,
 nsc@kernel.org
Cc: jani.nikula@linux.intel.com, akpm@linux-foundation.org, gary@garyguo.net,
 ljs@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 masahiroy@kernel.org, ojeda@kernel.org, corbet@lwn.net,
 qingfang.deng@linux.dev, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kbuild@vger.kernel.org
References: <20260509203808.1142311-1-julianbraha@gmail.com>
 <8fe7c7c8-00f7-4a72-a984-e929f71bec22@gmail.com>
Content-Language: en-US
In-Reply-To: <8fe7c7c8-00f7-4a72-a984-e929f71bec22@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 16318535B10
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13133-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julianbraha@gmail.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 5/11/26 05:24, Demi Marie Obenour wrote:
> This adds too many dependencies.
> 
> Some suggestions:
> 
> - Use system libcurl instead of ureq.
> - Use libc getopt_long instead of clap.
> - Use manual FFI bindings instead of third-party crates.
> - Use the C Kconfig parser instead of a third-party library.

Hi Demi, thanks for going in-depth on the alternatives.

Unfortunately, given the amount of analysis performed on the parse tree,
even just replacing the parser amounts to a wholesale rewrite of the
tool.

I will look into the others though, just to reduce the amount of trust
that kconfirm users need to invest in the Rust ecosystem.

- Julian Braha

