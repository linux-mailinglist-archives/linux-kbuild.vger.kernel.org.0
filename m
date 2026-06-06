Return-Path: <linux-kbuild+bounces-13606-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jDfxONE2JGq44AEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13606-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 06 Jun 2026 17:03:45 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D8964DC2B
	for <lists+linux-kbuild@lfdr.de>; Sat, 06 Jun 2026 17:03:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=c8f7BAO9;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13606-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13606-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5C9B3013689
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Jun 2026 15:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC61222652D;
	Sat,  6 Jun 2026 15:01:38 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92AC7175A75
	for <linux-kbuild@vger.kernel.org>; Sat,  6 Jun 2026 15:01:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780758098; cv=none; b=nU2JTalpRecUZwX5nzz1MFR7TgNMyxwTNI3L8GYTlEg6odoEQwojcBuwqH7RDe4b63i2iK7ofMvyLjFDk6y1ouqjvj8C4lJ1B/iPmtnhkVfAZGq0ybzLtP/5NnZJYTxoijvNX5qO42Q6yWK7Yqegr47EA/gBboA8q5vY1bvcneM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780758098; c=relaxed/simple;
	bh=Q7bvcNgJBR0xuXybvJDUiVtpofQYpuoyQGJUe+NPFBU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bpFSoBhd+PNoOj7hJaWJr67qaXxOmIOrgkoaDtGTsytqtKvIxCDtBNElFhQobczOUGG9rycFNSpU7+6PvXroqir4/V6drFl+ljK8R+1WEQecGK0HaleFnDcalOxLjkkXo+EBz25OJfNx+sWIKTWDvLg16x0Q4V5DZE1+jcNS9us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c8f7BAO9; arc=none smtp.client-ip=209.85.128.45
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490b7866869so33966225e9.2
        for <linux-kbuild@vger.kernel.org>; Sat, 06 Jun 2026 08:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780758096; x=1781362896; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7bvcNgJBR0xuXybvJDUiVtpofQYpuoyQGJUe+NPFBU=;
        b=c8f7BAO9NBT1bmm7IlC03FBkQdql/LMFu+ynTcKEKX8LxAPayqKSEY3wKFrDMa4KrS
         dAK+63rIL2yVAmi2wMvzQihE0pQLBxITm6Xkzq2r44ABw4aCS9eTihxA0SfZ8uU31sTN
         Yp3hrU+xFgp+xbKFDHw6j9y0VPu4/a0ZG6YJEIiicH3wyWEuSsfJM9jp2Qk0N3QGnQJ9
         Jcf+Mexai8N46jQ1im+GY6lMwOw6leRSEDurx4FLobsegcz1cBLdCzVL20zU6W4r1Gkn
         e1PoW39rmMjHMmhr+xv0Q77Nu/+RD/sIDUfmZNMoWBAZz5iI9cGyxE0Evx8PNScn/JuL
         4NdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780758096; x=1781362896;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q7bvcNgJBR0xuXybvJDUiVtpofQYpuoyQGJUe+NPFBU=;
        b=VvwkxAty1u5rwg79crs0/nt/IDRqtqJ7Y7j81hlwLYjUD0Y2e3YPGT+GgbHtkgHEa9
         pHe+BMozy3snApKh3M+avuUGZs/4/pkP0Yj99U45VUMdrI7iGzNwoQy2fT13njF10IBs
         8cLZGF4VEKIU35HC1CuQjHkewNdbh+PncyAMAvKON2gzuVeqhLTgpa55OWTq7asPsrcu
         Jco6wzYc0KHV3Jfh+ox5c7rTwkTqipo2Y3fNQux9wdEsNdI6g7A7OJUeNw0+fbqijgS/
         Kue6kh8KuXM8WOrruBSNXc15oglCKkatYxaAVnSLf3Mk8Zp/Edvf5tZ1fNePjzvLRgNf
         dpJQ==
X-Forwarded-Encrypted: i=1; AFNElJ/m3xdEY6Gu01zUUYWMfnIIlle9NzASGzxd6dUa8Xj+/B6aZEi6YmLmgAvJ7aAtDbpy32xsQjmiyGqqR08=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyFTfSiYYk+FrIBcnL8AuJhYVB2x6WeXUk1BLh+lJoN/OoUS+R
	9bzRRdH8flB3X3S0tFeQDtb/StZFnb97LvZd5VqgZpRxDH6+rC0rd6qP
X-Gm-Gg: Acq92OG+2hLYXnSny4tZUN4AawswnK40z3znepxJ5mL+o9mwGD7s+vJa9IdfPGOtJUe
	xoldXDikWSCruwAOj2gvCO3CBNHxbgcLw4pBlgRQMd2Nd64trupvnbKqIIH1ja7FKAUIBUq182l
	5/+AvEStwUTPAyqNhDmwONRLh4dM8z4pXYcoprDyEFUmjZZ7LrCfR2VYy431x2d9lz0ek1M2m+7
	DOJEXJDfux5ZVjClvF/P4o9A6xSoRdzQw9Tl+ep008Q5ALN+45gP7IwvwQpiFwQ6UjZjbMIf2pK
	I/uN8NEoFzH5a6yVN5vyuOsFn4k8X1PbRC9xlF/df5QE+TZwoxEwgLssdvibtMjHAGTuMe38gcp
	xnFfJWFBCg1ZZ/CNkoOC9KcmJZshmV6Py71u3bFmkuhota+Vkv1vUVcTrFmkdsTSbYJ7dh+Xmgs
	XwFUpDPXy8Q1pSo+oZ4OQN2kcXa5355mPl4T4ZXMJDaiMw2m1oeoF+wv+POlWAya8k3voNjPd6Q
	4xYh4ml0R2sRbp2zygIziy9VGjAYA==
X-Received: by 2002:a05:600c:3ba1:b0:490:b072:1be6 with SMTP id 5b1f17b1804b1-490c2633778mr146118015e9.25.1780758096032;
        Sat, 06 Jun 2026 08:01:36 -0700 (PDT)
Received: from [10.128.10.215] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3cc140sm290985935e9.9.2026.06.06.08.01.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Jun 2026 08:01:35 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <a5d09cc6-2878-443f-899d-dafb286322ad@gmail.com>
Date: Sat, 6 Jun 2026 16:01:34 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kconfig: warn on dead default
To: Sam Ravnborg <sam@ravnborg.org>
Cc: nathan@kernel.org, nsc@kernel.org, rdunlap@infradead.org,
 masahiroy@kernel.org, grahamr@qti.qualcomm.com, nico@fluxnic.net,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <20260606140008.271929-1-julianbraha@gmail.com>
 <20260606142326.GA117482@ravnborg.org>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260606142326.GA117482@ravnborg.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13606-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sam@ravnborg.org,m:nathan@kernel.org,m:nsc@kernel.org,m:rdunlap@infradead.org,m:masahiroy@kernel.org,m:grahamr@qti.qualcomm.com,m:nico@fluxnic.net,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[julianbraha@gmail.com,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julianbraha@gmail.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 42D8964DC2B

On 6/6/26 15:23, Sam Ravnborg wrote:
> I looks redundant with the two loops were we for the latter knows it is
> a P_DEFAULT.

Hi Sam,

It may look redundant, but we do need to check each default we encounter
in the
```
for (prop = sym->prop; prop; prop = prop->next) {
```
loop against the previous defaults to know if we've encountered a
duplicate default condition.

I guess the other approach would be to copy each default as we encounter
them into a hashtable and check against that, instead? Let me know if
you have another, preferred approach.

- Julian Braha

