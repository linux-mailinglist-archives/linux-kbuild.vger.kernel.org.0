Return-Path: <linux-kbuild+bounces-13322-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPdUNoUSFGpeJQcAu9opvQ
	(envelope-from <linux-kbuild+bounces-13322-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 May 2026 11:12:37 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D1D5C862C
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 May 2026 11:12:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C1F03008A6F
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 May 2026 09:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31CE53E0227;
	Mon, 25 May 2026 09:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KTXSGOwH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D12336888
	for <linux-kbuild@vger.kernel.org>; Mon, 25 May 2026 09:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779700200; cv=none; b=On3Klq0wXuCt7wpJ/3x6KM4QAKCF2/5XZ5/0sWXJ762JxpE7X1amZDD9EhGgiwTp1PaK4zNVQXT+ZUzykRt2dAO/LxUg6rJH6P3i1+PuK3Ko+1GF9ZlWx0u1bGwXafVugacnYhqgKWWauqGcN1b8VuozM6LF5Z8BZsx+X4dBFgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779700200; c=relaxed/simple;
	bh=s1o8rPuKOK0mvDPXUGlimWNxmX2G9fMMtffeCke829Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=usVG0q3glL7dsF+BPUMFZf54A1tvzS4qs/v+1L+lz8/2GuX6+Ke5+3IW/KAqy/r0iv/hMOncpy5qLf3r8gwpEE3riuNY7re0bok8QW70AkQQASb021GEX+TJ6lEQWcKkYuqZPsmERNwqFiSraQE04kN1wNgSnkAlS1684p7boPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KTXSGOwH; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso80506105e9.2
        for <linux-kbuild@vger.kernel.org>; Mon, 25 May 2026 02:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779700197; x=1780304997; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G+qYWwqDH4Z0PJGC/K7SSgMve7keIPR/MKwl9QyQQyM=;
        b=KTXSGOwHtb6KCFkgtGI4L04M6625dCidOcP5hGq2jtqUA5FDgVWnhSGQKakpxnYqDt
         +/H/xmKoIiuaKUZoxS6kTFIg7KtavH7Pd0h5QiPVK2sXfnaB6PA9lKHo4CxPseI95y6t
         ZVtkNePjSqC5BFA8j0mDE5I7hnOBO+LkDICgK0/tWx0n55frMHtrPJix+YCJJ9QAgjH/
         zfaez3aXk+/7ozQZ3oJsVsV8yz8yQDjotMEsLFF+Zeak4H8Hq47b2JjV2QUtETvHoccB
         9nyZrVV2/ziKyxcMQ2YCjj2Se0A7Tme094TIn7Vmbivozzksa7pHTFF4F9/+VwBAbxJg
         NlSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779700197; x=1780304997;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G+qYWwqDH4Z0PJGC/K7SSgMve7keIPR/MKwl9QyQQyM=;
        b=QhWxGDhu7JgmIYnRb7HawINnWoRww/b5htJiYWD/CLqYnPiG7toFfBKyy4CIyljCrh
         UUqhXOBR0c/p8AbaqVo+f1xGVyB7dXDSY0DESJ25xCPMsjEINsbQNPHZLFKiSJBllGly
         h5UfrJYEcR8U0IDldTojc5+GyumcOMDcwOTi81yE5nrIND8zG9fCW0WpDopqgr6P6RhU
         et4/Tzo84vPtQqfLeblfYXNbA58ZvSayAsI+F4ReFxLLsNzJwUGjItnmV77QcYv6iIZR
         DkkyOarOwbj4IaIOSYj8BEcMklMOovZ8zW+H+5UmSK+A5nrB/VOZ1Gjndb2cipkD34Ho
         85Mg==
X-Gm-Message-State: AOJu0YxPyj3B2zrzWspYVqh1zS5BHXgSAZKvKGZ8Or0VPKBvj3plakD+
	CGwczIZEWgBfR16sa26Tr/X3WRkVtJbKYWB6wO7BhSarkVMCt4OXVUAQPA5R7bWTyIMVcnxPzuR
	qlBSv/wQSXA==
X-Gm-Gg: Acq92OGewTmqPPx08U7kZiD/Ul3NaKl6eOuRcC5sgi5EhRiJAB3YnBsawtE0LqjO6Jt
	YD7IUflLKIlxiYN72nnn3AO/6re/m5KN7bbB2qDmFjsmuX5xUvmfAcu+05Fk9jnIyZE8xEm10Rw
	7YQuhCtY3NyslIFZdL4Cuxg7BvOlXERrwvDgozViR5ebvGuK2ikRYjrGdtDCDatmALYrgXYaqJd
	A/s04aLDkBlGtvuK9CfzJ2h9eXpD7+6O6WAUoK4N20B8mMGHYfTvwZ8cXRw/cHINtws6wnbWgpJ
	PF5gTKd/W6qozIjd6KfPHoQ3bTZNDq+Ph8NNjP/ZPtG5xugkb1CDoI86/vhqCiEnSpQFRAxnt2e
	J9gNae2rBsdRekP+IM0jhcb8bkPO+wBnmkkGFWXlhCkwPd0Wq3UJiRs8dZU9dWshli8D/M8Wlgu
	xApf5SMmywLt3vwjzvr13Zp1hsXKWxSxRKNcBY6gwRInTpDOuYI4yeCZZD/t399ryakbklqU54Q
	SCN+LOkkqerh3z/848ref6W9Z7zPij0SCrA5zbZKai7TWDKMN2a+Xbn/3QJRf2pkKY2aA==
X-Received: by 2002:a05:600c:8484:b0:490:3c94:a3c6 with SMTP id 5b1f17b1804b1-490428e205cmr229760445e9.26.1779700197074;
        Mon, 25 May 2026 02:09:57 -0700 (PDT)
Received: from ?IPV6:2a00:1028:838d:271e:8e3b:4aff:fe4c:a100? (dynamic-2a00-1028-838d-271e-8e3b-4aff-fe4c-a100.ipv6.o2.cz. [2a00:1028:838d:271e:8e3b:4aff:fe4c:a100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49059fb42dasm120369045e9.7.2026.05.25.02.09.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 02:09:56 -0700 (PDT)
Message-ID: <26c47a0e-7a9b-473a-818d-455e68476dd1@suse.com>
Date: Mon, 25 May 2026 11:09:56 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] genksyms: Support arm64 CRC32 hardware acceleration1~
To: Wentao Guan <guanwentao@uniontech.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, masahiroy@kernel.org
References: <5d1b8b13-d590-497d-9185-609494135348@suse.com>
 <20260525080229.1570905-1-guanwentao@uniontech.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260525080229.1570905-1-guanwentao@uniontech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[suse.com:+];
	TAGGED_FROM(0.00)[bounces-13322-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[petr.pavlu@suse.com,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: 88D1D5C862C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/25/26 10:02 AM, Wentao Guan wrote:
>> Additionally, many distributions already switched to gendwarfksyms last
>> year. Unless someone provides a good reason to keep genksyms around,
>> I expect it will be deprecated soon and eventually removed. It would be
>> more valuable to show whether the same optimization is worthwhile for
>> gendwarfksyms.
> I see gendwarfksyms use crc32 from <zlib.h>, which from zlib1g-dev and zlib1g.

Ah, I forgot about this, so gendwarfksyms should already be well
optimized. I think that is the most important thing.

-- 
Thanks,
Petr

