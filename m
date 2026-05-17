Return-Path: <linux-kbuild+bounces-13228-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id chv7FqRNCmqQzQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13228-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 01:22:12 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 540E756457B
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 01:22:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9BC413001864
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 23:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BB52271A6D;
	Sun, 17 May 2026 23:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JrmlvSCT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269B8329C7C
	for <linux-kbuild@vger.kernel.org>; Sun, 17 May 2026 23:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779060126; cv=none; b=lk5yHd74x+Vw0bjwEi7z5owbl+F3tkhXUkUIvLBGzaBItXOkJAIXfpmhcazgzXJ5GD9GWW1+qfYtTEif+Ib9+98UC1OBwydIfYQY8cEnMGYajSmZiJhestYtvTpQKZwED9JHAs5UPOLHpjerX+vvc4ZvBTi8wtRXSJVElCfemHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779060126; c=relaxed/simple;
	bh=WxHYqkzp7/G7ttQ4qio7ZbKdNhBkpwbp4SLfPYgRBs0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=QSdJobILMxCeDz80IZLSyCf3iI25Ie07THmmutap+fzNQkkSsSPq724NhkosheQa/Ul746Dmm4lucdLovQ+7KLKGfcTAxIAjvVU94LLd0Xn9yfp5cpUOYzAfufq7dUuL6C+1OUe8rEattg1thxfkRP0R35rrpGUWDSkNCOjeJNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JrmlvSCT; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so15775825e9.2
        for <linux-kbuild@vger.kernel.org>; Sun, 17 May 2026 16:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779060123; x=1779664923; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UBbUGCFqJiMRYfsl+eF9tbHmcztNauGUmlMdpL91Tl8=;
        b=JrmlvSCTzJ7VL4x1ZyI7ZLr3CfFzZqnIWOpug8xh/mvmbUCqSy7abXVfjTIMJ0J76l
         wA9Ad2oLh8LR014R7KsKvbkZ4Xz/i2ez+ND6yEPNbZGOESA3yKNQ4WjF7zTaPARM1Z2d
         u5TjwGQ8GJoEIv1RKzRe4fGax6Wjk/3LLeshQtd9qOH2LlGaoB6Nw4VADZU/crPuwHM5
         UZ9fF7gwbM/HnRq4fG+Yes6NYEF83xNshonI3DYFYkIvrU8MPVcDMNS830Wxc4EeKN0f
         Hz+fWAYJNzHzEmEcQjgmaGmBJ5VrR1mK+MM2gkL3c160j3UcqqQVwLS20jxgLDQ+ilJQ
         3qmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779060123; x=1779664923;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UBbUGCFqJiMRYfsl+eF9tbHmcztNauGUmlMdpL91Tl8=;
        b=rc5ujLs1qNK8kagG/WMDMvnQnpFf5s8QlZB6/EeytWbbWrvwX7HpxxctpiY1+h2yOP
         1POV6+TaybuDPcTRS7yHI15m7yumkoPhqBEacHGZhGhvs+ZBv6vgz5zAxh9eGTvyiS1T
         Pw+V+L8NdocumNVfltzbp1CHllYZJ/sgr4aMxFo4gjzSoaO3Kwp6jRITe2R/LZrbo1/S
         wui7733s3gGf1McZHAYEYfzJ/B1YsQo3pIzJK086iavKuePhRgcxMA8P1+L931hzc4Jt
         5qj+TknIfhHN6/WlyWLPT+uewUYFQyIMtl7jrEUz8EH7rIcZ//Vdd/J6jLes1bjpxong
         LeQQ==
X-Forwarded-Encrypted: i=1; AFNElJ+AQws6aDZFUdfdAoISD65ndArrZ9Jig18l7cagCemFciydEq80Nmfd6f06x2A/aO2A7mBd+9vghqI6xo4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnobYoM0hKANQnN9siJkP3ohfJUZIDIozH/RRfDzBUt+l8g95f
	/5gF6Ra2+KVwnyJiTeATfkcARif/hYB01unJjkjvpUffu4M+V3gQ+FjK
X-Gm-Gg: Acq92OFVExCysntntdBR0oXuyzG9ntda6HiDnNvK/R/1n9CDtiuzzxLUdxoBtwK9eIV
	y5EJ/XqADMSw0VWTmyCMl1HrXQ1n3QgLOpJrRYJTn5k4jWKebbxgGVmbi/ligtbtf6PX6EoSM2t
	Ep3QQTafJQKDr1NlPvFMlGoajbSsJ285cZoInn+1fCRN3KDj2HcMTNWJOmuLQp3fF6GiUhzm98Z
	5Mh6Lpfbge45e1mRmm78DlvHba3cqd5WcFAYUQ1qpqqkjNCrPM3YIBQeS2D/iwimb9h/lS8k1XK
	p/5VNyMIN+np+JI+WA+oV9pZ94n0s2FuyXEUPVAybkmyPOGv/GNiI+STT2NT/KCZZMEb34v5EtO
	VCpF6URZUyrSwlSGRRL3RMxk8wF4t7fklslfRRX7aq63puFbCxIbtA3mPbJivJ5mpkuXmfRUvCh
	VdrpsVcf3d9nj8sYolHjTzVcnYhII3VJ+HZUY1VwE3AuuSGfF9ry2cpos=
X-Received: by 2002:a05:600c:4a1a:b0:48a:592c:e655 with SMTP id 5b1f17b1804b1-48fe6325f25mr113675785e9.17.1779060123186;
        Sun, 17 May 2026 16:22:03 -0700 (PDT)
Received: from [192.168.0.41] (bl21-200-180.dsl.telepac.pt. [2.82.200.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c8d39esm218924895e9.7.2026.05.17.16.22.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 May 2026 16:22:02 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <dc9bf309-ba57-4ab2-a297-206fcabe318d@gmail.com>
Date: Mon, 18 May 2026 00:21:55 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Julian Braha <julianbraha@gmail.com>
Subject: Re: [RFC v3 0/3] add kconfirm
To: Demi Marie Obenour <demiobenour@gmail.com>, nathan@kernel.org,
 nsc@kernel.org
Cc: jani.nikula@linux.intel.com, akpm@linux-foundation.org, gary@garyguo.net,
 ljs@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 masahiroy@kernel.org, ojeda@kernel.org, corbet@lwn.net,
 qingfang.deng@linux.dev, yann.prono@telecomnancy.net, ej@inai.de,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <20260516215354.449807-1-julianbraha@gmail.com>
 <c6e9481c-932b-42f7-a903-b781d38cc1a8@gmail.com>
Content-Language: en-US
In-Reply-To: <c6e9481c-932b-42f7-a903-b781d38cc1a8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 540E756457B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13228-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julianbraha@gmail.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 5/17/26 07:14, Demi Marie Obenour wrote:
>> Hi all,
>>
>> kconfirm has shrunk a lot since v2!
> Thanks for dropping so many of the dependencies!
> 
> It might be able to shrink it further by using the existing C Kconfig
> parser.  This has the advantage that it ensures kconfirm and Kconfig
> will interpret the Kconfig files the same way.  I'm not sure if
> that would be too much of a change.  That's up to you.
Hi Demi,

I did look into the in-tree parser after your suggestion in v2. What I
discovered was that this parser performs too much evaluation of the
kconfig code during parsing, making it unsuitable for purposes of static
analysis:

The in-tree parser doesn't actually output a parse tree that we can
traverse and analyze, which is how kconfirm currently works. Instead,
semantic actions directly construct the symbol table *during parsing*,
with that symbol table being different from ours. I think(?) this makes
the overall process faster (which is great for real-world kernel
builds), but for static analysis purposes, we really need to preserve
as much of the underlying code as we can. For example, we don't even
preprocess variables, because this allows us to analyze more regardless
of the host and target. (Well, architecture is the one exception there
because we need to resolve imports/"source".)

I do want to point out that Yann, the author of kconfirm's parsing
library (nom-kconfig) is CC'd on these RFCs and has done an awesome job
of supporting the parser and kconfirm's usage of it.

He also helped reduce the number of indirect dependencies pulled in by
the parser following your feedback in RFC v2.

- Julian Braha

