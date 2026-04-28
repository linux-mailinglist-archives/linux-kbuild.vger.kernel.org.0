Return-Path: <linux-kbuild+bounces-12908-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDHMKvUj8WmxdwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12908-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Apr 2026 23:17:41 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5C448C45C
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Apr 2026 23:17:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 962F8301C596
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Apr 2026 21:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AC093B47E2;
	Tue, 28 Apr 2026 21:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O2hEylld"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74A13B5319
	for <linux-kbuild@vger.kernel.org>; Tue, 28 Apr 2026 21:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777411051; cv=none; b=D/0C8AoB2K3hmUWwBaP85f1Gc/PqzcemhbAAxQnvlMSRnIPVJbKq01Y657/mtu/Bez4PqLjoxx3hkyblMsZgs16WWtpfzL0nm9hXeN3MK6amFg7610zpmHR28DuJMVuurUINnPQTh7DjpOnHTiLmgGqh1XtVzfHzKdaqLR/ICYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777411051; c=relaxed/simple;
	bh=gb2jXumaQ80Hgko/o8kMeVGtw1AsX2y/zyw1qfL+Usw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EEkxd/TQkv4a6kALHteuGMFq62t4SQp3XtJq1rMBLWdp1bzxIeiMEUWALTA2oW7t1hw/+8KVQ6+eQDZ6adOUHQ7YD/hZMSk59WtFxalvzunTcz2fiUXEHzQ3YJrfcfGoIBx80uegUgAJHZGXvaehDyb435TM4Q4n9o5pom6o2ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O2hEylld; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so145283835e9.2
        for <linux-kbuild@vger.kernel.org>; Tue, 28 Apr 2026 14:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777411048; x=1778015848; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=gb2jXumaQ80Hgko/o8kMeVGtw1AsX2y/zyw1qfL+Usw=;
        b=O2hEylldg/Ld+MzaVzqtaUAL/E+9mDjaD8SfdcUFN93Yd/GlrMi8GkFKPNq7cXWrU+
         YUfmU+K3zGRdqDWWUbSuyNgmiMSvwy4PSmNuvQdPWEis1ltlx6E3Qyvi04D9eubF0iM3
         zp3WHUulwJzERtq0/0vU2TUOBwoxwvud12xBdH2GaksSfpOzItAJfMhe3GE/bg5AvIjn
         mmkU/zi9Kl+csNHdvyFQRIsZgicr//xDR9Ro+czErsnZ34USi4SLhd+gqKhACUL9B9th
         ht9CbGIlLNPyWRrO+xwS/P2oYqWy57vIGQSD+hrWfUoziMecdblAt2Mljpfcc6JFAOwD
         eiWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777411048; x=1778015848;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gb2jXumaQ80Hgko/o8kMeVGtw1AsX2y/zyw1qfL+Usw=;
        b=KO/BZuVgU9e4VEMC7Hvx0EXTKiQ+AK8A24fNrcH6eNvasEbIqLDxrzp9yWTTWuch2d
         jEx0Agw0yn0flmyUx6nkJRqYzzLwVyTQTnfvR+8id8kuD6BpBZeb4IeOxlpOVVUg4lIJ
         vSTFaShNp1x3nNBV8zTupmJMcXSTRCRt44qUq9ivdHMEXpS9dh5gKW5xRZS8EnIQMOu+
         s91PZ/oG1CLZF1w6neMG8c4kD3IlvmwUTS28TMLJITNQ8ALqx/UEI0T0oHO4x4f0qm5c
         9CjrBTpfoKojEvw9p/eISfTM65kRFuN9P7VnwX7UjVlT4sQ+CEo4kTpS9QvYj7qLi2Tn
         wTtA==
X-Forwarded-Encrypted: i=1; AFNElJ9wTnZb5BeTa80uWD6p8ipcWy82e4lGCxyE31Z5juGr94l8ShmxRGWewnAuZrojXnHRTpbVros+H/4ZBHg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+oZpBBjhulbtmb0///eCg9auKZPpQH/uSjBVAnmRVqOMHyOo6
	avmMqYoiAG2wdXw1QZPY2ZBPyGQIP4jFYggOtATs4qeE2SrZbeQKId3h
X-Gm-Gg: AeBDietLkFqFwHl1JGXfFK24a1nTLF3bsWfcyEpq4gBYugz90OpmjbN4nlYwKwXd0Pi
	n7gkby4euPEs09DEorwZXaoRi3ARz3ZBA8nJ4wR0T7+i+9w2cDdn45QWhCc6YfD7/ckNcrpFh9X
	XpOH9xsYQVEYumuPP0HOuToNCL35oqQZuYqeJqb9q2Gxx3Qz35r6ZrazErJUfg5w83JayneR3Ji
	0Suio4HtGLNosAvYLetEcF5Vtpin+lWXkMDzyMdCO0pwnEP3cAC25Ett6m4lI/nYyJJox0NAbTO
	lAW8KtpSOdPRQmieUUlXWWnrLZeV9+pdZmgDE4BVIDOlbUv8b04YwRVDlfKfWmoDl8dFaGocDdM
	EBtn5A/nwfRGWfdRQbM/tMukH1+IFy3q0yQtOb1kBlLHxa1gfC+mgu2SsB8CeTWfKTrt0FJzxtQ
	A+389z7K3XFm8gx2sYXSXKIYFZOIyJE6cbtH+wKnU/osXnBe1DLnaNyoeZiVcRpjMK2duxZg==
X-Received: by 2002:a05:600d:10:b0:48a:56d5:16f2 with SMTP id 5b1f17b1804b1-48a77adbe5emr54885485e9.7.1777411047872;
        Tue, 28 Apr 2026 14:17:27 -0700 (PDT)
Received: from [10.128.10.158] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b8c20f7sm7477795e9.0.2026.04.28.14.17.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 14:17:27 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <0751366c-2aa6-461d-87a3-84309f3c4735@gmail.com>
Date: Tue, 28 Apr 2026 22:17:26 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] scripts: add kconfirm
To: Greg KH <gregkh@linuxfoundation.org>
Cc: akpm@linux-foundation.org, ljs@kernel.org, arnd@arndb.de,
 masahiroy@kernel.org, nathan@kernel.org, nsc@kernel.org, ojeda@kernel.org,
 corbet@lwn.net, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kbuild@vger.kernel.org
References: <20260427174429.779474-1-julianbraha@gmail.com>
 <20260427174429.779474-2-julianbraha@gmail.com>
 <2026042727-delicate-genre-21fa@gregkh>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <2026042727-delicate-genre-21fa@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0B5C448C45C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12908-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:email]

On Mon, 27 Apr 2026, Greg KH <gregkh@linuxfoundation.org> wrote:
> You don't say what this fancy new tool actually does anywhere that I can
> see :(

Hi Greg, apologies, I wrote everything in the cover letter:
https://lore.kernel.org/all/20260427174429.779474-1-julianbraha@gmail.com/
and then I wasn't really sure what to write in the actual patch
messages...
I'll spend some more time looking through past RFCs and either separate
things out, or add some repetition.

> Did you mean to check this file in?  That's not going to work well...

I've found some ways to significantly reduce the size of the
dependencies when vendored (also thanks to Arnd), details already shared
here:
https://lore.kernel.org/all/d72badf8-7d70-4caa-96a9-d77e00bbb536@gmail.com/
so then we can remove the internet connection for dependency download,
and the Cargo.lock file becomes unnecessary.

- Julian Braha

