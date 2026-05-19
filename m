Return-Path: <linux-kbuild+bounces-13284-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBhLDFj5DGpHqwUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13284-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 May 2026 01:59:20 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9EC5862E6
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 May 2026 01:59:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 88D9530648AF
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 May 2026 23:59:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4AEB3ACA4D;
	Tue, 19 May 2026 23:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sa/CvbDD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7111B371063
	for <linux-kbuild@vger.kernel.org>; Tue, 19 May 2026 23:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779235157; cv=none; b=DJodDCLzOoHwlYGnVsBNIhT/A5XBtzN850PMAWYAGJAmIrhlmGPxb3NRiZocsk/gCoGqLapszNrxYQWjmFmC04pL+ZX/BSC7/QYN7JRs4UWo7ZWT8C+TlIQlHrP8G8T13/Q961LdQSFM24zek4IW+WzsnjB5CtT3rrBiYq+ZXYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779235157; c=relaxed/simple;
	bh=hN+rOoTRzyncpXn0zmh4YGuJL2vHhsnJR3GI52Zn8mw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gru3rJXvG5PTyuoAwh6SW9OO2Sbx9YW7khiQ451xEQugQIg+2M7W0ET12D/2Bu17jFsaE+xIUQxAs0fKVzTqYPTbIwGO/SgUouxH0U/fcm5JjrH/snbs4zFm6lVt+Dcvgrg0/7Jfh6xwoC5E3BnvAAxxgNrDS2rS3v0YmiDh8pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sa/CvbDD; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43d77f6092eso2332246f8f.2
        for <linux-kbuild@vger.kernel.org>; Tue, 19 May 2026 16:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779235154; x=1779839954; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Mr/UZLDxjDjpcXYV99x83XexH92eoT3nXxsvzQuM388=;
        b=Sa/CvbDDWbsSyDCdlH2KZxovlVn06bt4RrR8IMIApNF7RcfFJUfnYh4KXC0Zkm10qi
         eYFFlT2TP2sVi4DeijRXWWOgGsrWRYiqkZUXTncB1XRmkh01ztM0g5B6akvXqaDpxsCz
         RzK1l6jQLMHArRoD1OmlXwDznp17ra2hKmZb6KKaSoTv3rIZhAAaJhllbk0iS1sXFY37
         9HQY05tDGmbAX2q2dusmWQKkTMHYDZihA6Uw2FrLnbhhZKKhfXP82TPB+232IV40J3Uz
         ATLOHsu/+zeac0oQZVqj/5p1fWuig7Ky2TvaFsUc620WCOIWTV5u3mDXFIgjhIxgRW+2
         uK0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779235154; x=1779839954;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mr/UZLDxjDjpcXYV99x83XexH92eoT3nXxsvzQuM388=;
        b=hrH3HQWp977HgSvC233qTFFLVkRqGo+u8HGz6b26rvOSr9t0LuzPgVfMpMzJEVnfKV
         HhmE2X1fayU8M2V20AFn5peVXTEukrZo3otoBOjp1dzFOy5vGdeHxAIc+z1XoWIRAD01
         2aPeMj/jlTzFZLzRsoGMKD6hZkOwTki62zGd+yqIfqeG2p0thpP6tPNk4lcAaBAnIsqg
         Y9dIXibJIIKpW+M55idraUk5Ub8fNYVUHaatsPrgWH1x1KYrT5ol/OnVpCt+Nehknwhu
         X82ZzaToC8LJghE/YnuHU3VroD9O0hRVbpgTULDecqub15q61ODrxfBFEaYVp48XdTOL
         9WbQ==
X-Forwarded-Encrypted: i=1; AFNElJ9U5XxIy5wlUs8cYdgvD2mQjnENgGg7CA2cTUV2PKF00BiETHYbkO+PRCR7YIJYmzjXd0D/6OlmBtJxRmk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbiICuDH4RPjIKQ75AEcKWYSKLIrTemDrAiTtDoEWoQaXQr0Zd
	EmpnQg4yfZfFI7Fw8x01X7KctXe2/HV22JcxWhkK2Qsj1/RN5twaRGig
X-Gm-Gg: Acq92OGGccex0u0hLXxty/qKNXfGu/1xENSSHz6I4F+ULQjIYg1tLfOnEzm6le2E/Re
	c6UTEbhRTDq6VjmC0X2fqTHwWK4VJbYmIeM6A8Z4dKMfCZS5GPWqPrt/Sep1V6hx3oqZ7Idg6PB
	iJ+PS9kQ/pD+E7Ka9vqjX/tQA7BNjcJctTv3nGGos9GQRQGyNZN64eEfXvssM5Zro9NCFepTG5B
	ef5XZUP9eSkdW00drvvXbh5ErpA7KbkYKaL2VPF/WQGrXe1TINWwkBmOBbnDfPgR3pTGhqdEXDX
	5N2WGjQyVuSB40VL6MEtQCIMYUdutbVxzl7nGQLVHKY/UscEC9tAGoH7TMlImHaROVbIJWpsFm/
	LiYpqVJtePHNQ4Vo1gMi69mewf5Vvi4bjjUKXlk9bvufsB1blswNo30YjLCium/1cV0bH8Eqdx6
	VuE5Riax7RZUIOQhYkHpal35d5ba7iQabmCKVQdwZf02d6BHxEdYGXPsQ=
X-Received: by 2002:a05:6000:2388:b0:45d:7472:8fdd with SMTP id ffacd0b85a97d-45e5c5a5e8dmr35675472f8f.9.1779235154465;
        Tue, 19 May 2026 16:59:14 -0700 (PDT)
Received: from [192.168.0.41] (bl21-200-180.dsl.telepac.pt. [2.82.200.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e767d0bsm47565286f8f.3.2026.05.19.16.59.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 16:59:13 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <e0ee7e31-0f0d-4dfa-acc4-c1822aa031da@gmail.com>
Date: Wed, 20 May 2026 00:59:06 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] kconfig: add kconfig-sym-check static checker
To: Andrew Jones <andrew.jones@linux.dev>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: nathan@kernel.org, nsc@kernel.org, andriy.shevchenko@linux.intel.com,
 rdunlap@infradead.org
References: <20260519215804.84025-1-andrew.jones@linux.dev>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260519215804.84025-1-andrew.jones@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-13284-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julianbraha@gmail.com,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 9E9EC5862E6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 22:58, Andrew Jones wrote:
> The checker also warns about uppercase N/Y/M used as tristate literal
> values following the same logic as checkpatch.

Hm, I tested this out by manually adding a:
```
config KCONFIG_SYM_TEST
  default Y
```

to the end of the root Kconfig file, but the script didn't actually
catch it. The hint about casing only appeared with the 'N'.

Could this be a bug, or is the Y symbol actually defined somewhere...?

- Julian Braha

