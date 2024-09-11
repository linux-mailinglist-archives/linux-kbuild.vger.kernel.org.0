Return-Path: <linux-kbuild+bounces-3515-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C2B975102
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Sep 2024 13:43:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 670C1281443
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Sep 2024 11:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2DA418732C;
	Wed, 11 Sep 2024 11:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Jb8ZBocJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C2C15383B
	for <linux-kbuild@vger.kernel.org>; Wed, 11 Sep 2024 11:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726055031; cv=none; b=DQXlSbvHvuW+Khm3g2iM3H0G2H7pzIkB19lylEjesfzBvajmkzNIovZSpm8yZLLjbQINv7h4rtfDMkU11mAo3WgJiP4lIWkq8JDRzLAmMy40mCYobxBL3aIq9g7zqRmmqD9wXEcmJNNAive26x+owGnwqxqH+/p0WmZO82kDQOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726055031; c=relaxed/simple;
	bh=9hiabN1M+tFNIMHDE9LStpgFSYodQc7eDrfAIyTkOt8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XJLgmFuvU2o23VGlqnE5gXBlOBY/hHJjmDo26CizxrUXI7MACfurLnsvJ3k0w3t5HT+flbUhpuQJMZ8E7fUc3eJgZiXoW2iWKjcCRkZCI9MZtd6L3tzKQP4tfcbngDInNtbXrMs9N3PuQyWKnwR1oFeEn2qPax9qnYH/+va2lZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Jb8ZBocJ; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a8d446adf6eso496475966b.2
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Sep 2024 04:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726055028; x=1726659828; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0836bPdfIiVhJZmRIpwdukfSHhRJerCCPsKDHVUH+Xo=;
        b=Jb8ZBocJ7jZyWFF5OTAhOZOcqC4RFE+/vrOVXNe9nZnnRyckUmpcX6gH+63iEWoaPn
         jv8AOOF0tW+PfpzU3ER3mDJQAFv77eaKEfhqABdlqQcy7zofOqc2eBpyJzwZ8QySxsJ5
         BeDAi9IBXE5XywostMWjEzru4y14iYalgzcZi2LK1WD9DuO+wPsHoyuRTsOV35jvDnRh
         I5jQ5a8qxpE+YsPhAL7zDWi7BWkIrM7Xq/u2GS0kMP9eMRMk2v2QrTgHv3JJxeLnpKrh
         fIV3CWDoETaj07/Z+FQBx85De44D6+7F3hMIopwEpsS0x8ug+EH8ynJE+TFFPqNZR39p
         HieQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726055028; x=1726659828;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0836bPdfIiVhJZmRIpwdukfSHhRJerCCPsKDHVUH+Xo=;
        b=ngnZRNt4EsuA4lUXMOsHSfStxMCb0Bcc9m+uOrpBNKhgRXEDXrdy86rDWnwnMGCRqR
         A4iQtED+wJKdrkZpw6/NANOAABVDH8yYRcqQ52V203NOaTO/ttnx7ncHZTLR6168zbBH
         NsQQCPM2WdgLtW4x0Vq7DliLlI4CfesgKvdz7t4r/ZFghb1FjWkd/57QgGO9oOv86nFq
         v6DFBhQFrm8HZ/88fstLzt6Hnj8sDUbMGb3gYPead+XmLgNTSq4nnxptkSoS3CoS50s+
         fCZ5pmv6LE5nb4qX4DEgOL8YGi7zIwluFobW/BouhjT6n6yVYiSKlJysDB03+F5zZxIX
         zh8w==
X-Forwarded-Encrypted: i=1; AJvYcCVChENdo4YKp3xffJof6LFaGgFsq3DoaXyUl7Kq74iUXDJKXCF5ery+k0mTH0SXlH6Dym8x4oDARIa0QRs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq7vAkkuX9lkbP34pviiFyK0LIzPZmbenYPTm+c9Qxp4z+gjud
	fQscn01xi7bys/Jn9saOCQJnWRK/iGzvvnRlhvxuHKH+ShywDE/QjAKzKto6Oxc=
X-Google-Smtp-Source: AGHT+IE06+xDqkLYzGpC/L+2NLQeM/nBC/Gy5jIkoMSaoEd70RtXRRQzFeVamgQr7aHe0PKw8Wnx3w==
X-Received: by 2002:a17:907:2d0a:b0:a86:82e2:8c64 with SMTP id a640c23a62f3a-a8ffab78821mr368553266b.35.1726055027526;
        Wed, 11 Sep 2024 04:43:47 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25835d97sm606731866b.4.2024.09.11.04.43.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Sep 2024 04:43:47 -0700 (PDT)
Message-ID: <599892ec-3cf5-4349-984b-7c94f2ba5687@suse.com>
Date: Wed, 11 Sep 2024 13:43:46 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/19] gendwarfksyms: Add support for reserved
 structure fields
To: Sami Tolvanen <samitolvanen@google.com>, Miroslav Benes <mbenes@suse.cz>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>,
 Petr Pavlu <petr.pavlu@suse.com>, Neal Gompa <neal@gompa.dev>,
 Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>,
 Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-37-samitolvanen@google.com>
 <alpine.LSU.2.21.2408301114000.1124@pobox.suse.cz>
 <CABCJKucCWfeC0yL6Q2ZcBfef0tMd9L_gmHRJt-cUYkg_4PDtnA@mail.gmail.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <CABCJKucCWfeC0yL6Q2ZcBfef0tMd9L_gmHRJt-cUYkg_4PDtnA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/31/24 02:05, Sami Tolvanen wrote:
> On Fri, Aug 30, 2024 at 9:34 AM Miroslav Benes <mbenes@suse.cz> wrote:
>>
>> yes, this is one of the approaches we use in SLES. We add kabi paddings
>> to some structures in advance (see [1] as a random example) and then use
>> it later if needed.
>>
>> It is not the only approach. Much more often we do not have a padding and
>> use alignment holes ([5]), addition of a new member to the end of a
>> structure ([2] or [3]) and such "tricks" ([4] for a newly fully defined
>> structure).
> 
> Thanks for bringing this up! Sounds like we're also going to need a
> way to completely exclude specific fields from the output then. I
> think we can use a similar union approach, but instead of instructing
> the tool to use another type, we can just indicate that the field
> should be skipped. I'll come up with a solution for v3.

It might have been mentioned previously, not sure, but one more case to
consider is handling of enum declarations. New enumerators can be
typically added without breaking ABI, e.g. 'enum E { OLD1, OLD2, NEW }'.
It would be then great to have some ability to hide them from
gendwarfksyms.

I think neither of the __kabi_reserved or __gendwarfksyms_declonly
mechanism can currently help with that.

-- 
Thanks,
Petr

