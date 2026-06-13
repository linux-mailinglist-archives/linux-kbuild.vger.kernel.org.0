Return-Path: <linux-kbuild+bounces-13745-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id s1r6AcxRLWqfewQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13745-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Jun 2026 14:49:16 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7195F67E99B
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Jun 2026 14:49:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Vy16bRjB;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13745-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13745-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 55BA3306A88E
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Jun 2026 12:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EE763E5ECF;
	Sat, 13 Jun 2026 12:48:46 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891E23033F8
	for <linux-kbuild@vger.kernel.org>; Sat, 13 Jun 2026 12:48:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781354926; cv=none; b=S6lARxlzZsyswvuMXuQsq7igDVSJBWVOOlVsUQTxyTIGIwG5BQOe3NBozq7ZGCb3sZ65ovHKXoOCPfkkwt0HWTH2RZZanxXisuyHsZNVIAxZy/xE17HkpJj+ui2db2/xF9j2nKr9Dc1Gtfg+MIeDpZw8eXzEThpBjHaFT5YsxXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781354926; c=relaxed/simple;
	bh=swe7tHyGDAS0LgqXY5o7c8Rigm+T1uVKVB09wXPt760=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XKL37d0C49jpZD8g8cQ7RFhVcSTJEhlftXSzHD/z+DJJz7pFM3RkPJNBqaOTep6MHFWeUkajUD6fWnT/XSYzBxAohPmkFLXm/C69S9jpBVjd3IFFoh87I7IsgULQeUONvrjOomdu/HNw+vZgRPsru6r5BstojDBXhBqKIaOzn6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vy16bRjB; arc=none smtp.client-ip=209.85.221.45
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-460166910e6so1039946f8f.2
        for <linux-kbuild@vger.kernel.org>; Sat, 13 Jun 2026 05:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781354922; x=1781959722; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=X6siKJ1w+rEnl9pZ3MoidjUGxh10zTJghXGxeG18mLU=;
        b=Vy16bRjB+R+62Q9Rz5R6g711rQVmGjQSQDZGNRIHGhhIgxy7YjeSHu8hIMKTvwtaPJ
         Si3JV7Qiw7yoNbE1yWKIum/52613DnODAwrvYY2J697Eh2QdWOnj+CH7OzyDh2zkNZhr
         ABPUtMlPba6deHVGe7HBqTfP0cbwKzeaDqcNfbzqrj3G2F4QtxFlyl1nQuisqOrvwMWW
         hI0SXjsuksdTO9fVu2JKZnm6bcw5K0llZlKEel2tIqciA8TuyBfFKg5vDvxQFb9GRw2r
         WR9758nP/GvYpAq2S7Yzco2x+ECrxEH3RtXMdTeIoxmoADcccZY8vNrq7OF9/dzIsxCw
         gozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781354922; x=1781959722;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X6siKJ1w+rEnl9pZ3MoidjUGxh10zTJghXGxeG18mLU=;
        b=OsGIzQ3eUyDU3QT9zOG6CeqEFEh3ApacTR4PYTSv/+958V/6pMAJdKv6D/uLBNLvM2
         PS1TOem3jsBGZOMilvyhjlMav4BLexSLLk2KXn58r7ntHWCCuGDPB33Bdoq3KvpBWUGL
         PwaO8l1ZGJGMqaxlBojPUniLsRfOZuySaZE7mFZsEcmm0fxneS+S1Uj1xZZ4X8iwqKpu
         fsIu0FLfNpnG6HcmSyTZCuiHxp/hpo3jAGh2HvF32EH+FdOAgXBI+K65e8yKSZ8QNifW
         MBEgIRPbeO2qQfTcRB0Yh6I8rKlC2tvXDYtS+bgGmfTQr/US6C8fHaYXnqP+YM3SOfQ2
         bkBA==
X-Forwarded-Encrypted: i=1; AFNElJ/J01v8LEWuD0N7Jr9MJInO7JKBp45o45zn7Ek1Fqym2xQWfuoxvXlgHfHER6KNmRg5705788CBcN1e51I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf4G2YSvKoL0DIbU+zcJigz/nFgqtWrQXupaU0QpOeonTKTpjb
	y2ACqre3xi1NVc8ObgBdAN5J6wYqaDkNG+eUsmE6dJfILGwpy+gb6sABiEc0Cm3sGZI=
X-Gm-Gg: Acq92OGTS1vyxP6pGxvrwlEH7h/2oIsBEkNzomMH6TzqgYKrcs0ltLMmfLaH0z2P2FF
	rD4mFZaCbQICCQGbeIx+sGSN+ea/5M/jBagzWGDh8eX41tmTdthOGocUOTFF/MogsGeOg3ypnXz
	ob6bI1W204ElxQhdA8a2QdkGLnG7tABtFSgyrmqjSf0M1mTgFLLsY6iqJSn09nAYhc/hpXSXdiz
	Pxy1IPNB0vIhZVrAdtxihBVt1yTs9g7SFneBuVuXvrXPZQtbwb3DxpF1WPgik9Iw5ubq2JRNsO7
	tPudGVxfqRhYTnjiPjMu+OJVu/EY+G3OKK+ZT+xFhCFhQtezHuxEwdgowU4EEThtLgmP1cgqgfO
	A/W3JOEHHZ9jpK9CBfE//CRS/sKuYC1WL2ulQU82V3l0wGAotAIev7opeSNeMxmiUj7zWkbw2+k
	oxyR6vDcOt9vNazlEKSg4utc6N15RI1tO9k9HQLNiCedh5WrBDR1BAoMSpZe5rDK4O6bb2dJlkh
	45uDJAaFk6gpvIHtbc=
X-Received: by 2002:a05:600c:3b16:b0:490:bb45:79ef with SMTP id 5b1f17b1804b1-4921fdefb5emr37427245e9.0.1781354921745;
        Sat, 13 Jun 2026 05:48:41 -0700 (PDT)
Received: from [10.128.10.215] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea95c512sm88407955e9.2.2026.06.13.05.48.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jun 2026 05:48:41 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <7206bc69-c35d-4ce7-8083-ae6586e7543f@gmail.com>
Date: Sat, 13 Jun 2026 13:48:40 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] kconfig: add optional warnings for changed input
 values
To: Pengpeng Hou <pengpeng@iscas.ac.cn>,
 Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-kbuild@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260611060000.23858-1-pengpeng@iscas.ac.cn>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260611060000.23858-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13745-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pengpeng@iscas.ac.cn,m:masahiroy@kernel.org,m:nathan@kernel.org,m:nicolas.schier@linux.dev,m:corbet@lwn.net,m:linux-kbuild@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[julianbraha@gmail.com,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julianbraha@gmail.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7195F67E99B

On 6/11/26 07:00, Pengpeng Hou wrote:
> When reading .config input, Kconfig stores user-provided values first
> and then resolves the final value after applying dependencies, ranges,
> and other constraints.
> 
> If the final value differs from the user input, Kconfig already tracks
> that state internally, but it does not provide a focused diagnostic to
> show which explicit inputs were adjusted. This is particularly confusing
> for requested values that get forced down by unmet dependencies or
> clamped by ranges.
 Hi Pengpeng,

This change would be a huge QoL improvement for me, thank you. When I
generate config files with external tooling, I need to do this check
manually.

It would also be helpful if config options that are removed from .config
would be printed, since there are config options that are only defined
in certain architectures.

Tested-by: Julian Braha <julianbraha@gmail.com>

