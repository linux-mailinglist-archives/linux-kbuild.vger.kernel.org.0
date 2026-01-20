Return-Path: <linux-kbuild+bounces-10724-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHbvA4NxcGktYAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10724-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 07:26:11 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A6752078
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 07:26:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EE16E72BA59
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 12:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3B8642669A;
	Tue, 20 Jan 2026 12:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TxXPm3SX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D503876CB
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Jan 2026 12:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768911522; cv=none; b=aqeJzNOJpwKgQJOyylQOS9WlYVhmH+FspW7Ide3Q4aq3W9w9X9o/5mF3zrqlwlgKF1Z6OyUvIkyIdULE+ZMXC9yFV22Fy4MhDLNIhP0JgjLcGKMz/Am4oK1f19c4DpYqe5vaxPjGc9hIgVJz/OxF7LS9PWRNTiQdbeyJSire0V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768911522; c=relaxed/simple;
	bh=yGS0ZhV/HmECUguQyiOv2PcpOrExvW9AuC6J9fOS0CI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nncbfw+IKMQSCh8Woy4Z5bkzeh9QUjd1NDdMRZbd6t6itI3Lj5mIL/CShUfx2K+b4/dDPz/0972Y3X8PgoLHID6vIVUCVtTo0/jnUF6nMYDFE3pzvRNdYi5S1ePtwX1aVoe9BX7N125ReFgmvlV/GPYGnFi6afRbLWWZiKxld3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TxXPm3SX; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4801d7c72a5so27578065e9.0
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Jan 2026 04:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768911519; x=1769516319; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s1QLxkpeIxpFrMstTs2QBaunDmwUVDSpnYCC8/tZjnk=;
        b=TxXPm3SXzYXEWMyPWwXJiE31IPvj/QAgzjMskSNjekWpIy8sah4x6dvWZzlGpMvHsV
         Pox7nQBpHWJuXZuF11o4Ox9fIXdsJNPC9rZI5yD1kdfwdLgwWw8bMHFs5OYVhbuvxm4H
         rCGYf9nNMyNXX+C/pgJxPTbVwsjf873WS0HiF1eiDfJWhfWyZIDbRsQN+YQWTvg9epgM
         UHucV0hmPFBL40hItqhVW8m9sXCFsV4LGTudxesOaYwQ/jNAVRCrBF8L40es0f+mF46q
         dfeWBae3RNbHrcqFTrw+kcgdspJ3c284/J72VorVubEnC5EVQD9qm1YzI63FuQrrdKsP
         Ubzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768911519; x=1769516319;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s1QLxkpeIxpFrMstTs2QBaunDmwUVDSpnYCC8/tZjnk=;
        b=J65OG02aS0Ufq3wpBGiS9SRwJ3IIytwefWVWG8Ks6o3TiDqCREHZfg9U7oOQd87wGv
         bFKWdAFu2lzfiSWrwxw4KBh+8BRuwY/kLEa+WZE85gBlBvc6iLapFyI8I8OJUEvZK8l+
         TKVlHjFHQESFVt5qzup7TopiNaLoX8yHBlkqsjNrnQ64I5fPwe3F0mwNcUIWE6i8QH8I
         Z4DkIEg/njddH4nBO24+Bm1RVYN/WFc7c3YbJGzSWwgaWVPKuBEatj4gMmAkx0W5a5U3
         qjL8F/BMCjbAqH4nfk3Rl0uS/7ZvpY0I766mXReSIGXgaXICXoI52xl/JcuB9BCGKGN0
         bXqw==
X-Forwarded-Encrypted: i=1; AJvYcCWmmNVTjkCl+TzIrqbs72njwJ0/yBa5LibnGk3se4S7OgaLCIUWDcyKqhoH/Sv6O/P88yv0GI9Ukz1sPJc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxkhO0lIhGjHYdVG2WZhfQtxriHBpN4G7uWiC+kC6pF6Y6edy2
	Xc6ehL+cT1sRFawpvk7Nsf94HigQg0L270JVl6aBxpXcJ/27w6NX/5ockobj7ph7Klo=
X-Gm-Gg: AY/fxX70mjaFtgc56JuQMVEv4sYXp7Ed2B4k3XAVUwvIoPDQ7SBwl1qtQW4kVcCbwHW
	0DTXr9O1oiiL1j4zOja8pOo5tqO47X19jSe2ly89IX0vJH6Hc2U59Bpxyp8iFIfbIp2/y6rEKpH
	lPB8OQyvoprENA6SPvAXP2WMFXOPa2vEMKywzzSR9lHK3ViNO9C39yhOwq9ETgcYXLVMVmw9JZ5
	8hh25cqEnrVwwe96IMa2bSQ+4kiNjIAE9ZUY/JQHL8hwCLh2nc6SJlv+yShF06ep3gtrMRZHDc1
	YPWzQ4KkHCp5VZam6ktxt9F3sh7C30H/Lv0A9SFZqmMLZYklgHBBlREk3D4HonYnaT8jGeAOtOd
	g/bAvg9nm1OFC1GIiYbb9EwThGAxOH3uhHpWPLNqI4lMMEFQ/Sf8cSWZpTPIfEGiSN5t6zjYimp
	RzXYLx0EoE34aVeoOmMf/gp/LeKcflVw==
X-Received: by 2002:a05:600d:6413:10b0:480:3a72:5c10 with SMTP id 5b1f17b1804b1-4803a725caemr54816275e9.16.1768911519124;
        Tue, 20 Jan 2026 04:18:39 -0800 (PST)
Received: from [10.0.1.22] (109-81-1-107.rct.o2.cz. [109.81.1.107])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4289b7aasm306330525e9.2.2026.01.20.04.18.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 04:18:38 -0800 (PST)
Message-ID: <f1128fe0-96bf-4819-9315-dcd4a7dda2c6@suse.com>
Date: Tue, 20 Jan 2026 13:18:38 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] Documentation/kbuild: gendwarfksyms: Style cleanup
To: linjh22s@gmail.com
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Sami Tolvanen <samitolvanen@google.com>,
 Masahiro Yamada <masahiroy@kernel.org>, linux-modules@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260114-documents_gendwarfksyms-v2-0-297c98bd62c6@gmail.com>
 <20260114-documents_gendwarfksyms-v2-2-297c98bd62c6@gmail.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260114-documents_gendwarfksyms-v2-2-297c98bd62c6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,gmail.com,google.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-10724-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[suse.com,quarantine];
	DKIM_TRACE(0.00)[suse.com:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[petr.pavlu@suse.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,suse.com:email,suse.com:dkim,suse.com:mid]
X-Rspamd-Queue-Id: 76A6752078
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/14/26 12:47 PM, Jihan LIN via B4 Relay wrote:
> From: Jihan LIN <linjh22s@gmail.com>
> 
> The indentation in gendwarfksyms.rst currently uses a mix of tabs and
> spaces.
> Convert all indentation to tabs, and match the usage output and code
> examples with theirs references.
> 
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Jihan LIN <linjh22s@gmail.com>

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- 
Thanks,
Petr

