Return-Path: <linux-kbuild+bounces-8325-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE28B1EA31
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Aug 2025 16:17:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 801D0AA1458
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Aug 2025 14:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9356A27EFE2;
	Fri,  8 Aug 2025 14:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FNxRUF5u"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB78A27F187
	for <linux-kbuild@vger.kernel.org>; Fri,  8 Aug 2025 14:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754662663; cv=none; b=ZhAWu8ND2yWFsG4tPSC2JOx6w2ai/CPKTDbXEg/+iWFPwfdwf2rgKv7H1pVTEeJZ5RHgUjdL9oXhzKKQWr47lak/We/mhRVsMOm6MgxjWkbFnGzSaDdF5OpPDfJrtC/nmURuFBm2ZnqYnbIEVGdHbfTxOeLSV3F/U2qy8pb47nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754662663; c=relaxed/simple;
	bh=eU0T85JhnrkuKCzugihgR5bR47ZxosUPUFmxGIhbaY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CCgGAB0dsISdngB4X0Ww2E/q49tzcy/f5QJlinzN5zdkkpgunmrqxaTUbbxSdr7UiFEOn+IMthfULEiIplo8P0VRjfP6ty62Lodt6lz2UmVpIzHXSaKjcLgUML99qJyB3GziFWi/mYOmlR7Hprb5D6ZFqvQmpfc5On6dzue8Xmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FNxRUF5u; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754662660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=rHGDMQaKaiIFBdXakruE0SD84ayhWoaiRDliiR2k738=;
	b=FNxRUF5uECt6eu7+TLyrAS53XX7Ob5i5rikh25gAd0/yCqxKX2j4/lCO+OngD9QBMbbBYo
	4iVEFpCYGG3CpwmOFLxoK7Q1UdkrB35XsqZsDFY8DJi2Vnrk1avhE/iYtTMYSqayp0pdCZ
	rwPCD/9PbncSYxVTMlwvxR6TwUxJjPA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-XUTOHp7UPHuSs36JY4iqpA-1; Fri, 08 Aug 2025 10:17:39 -0400
X-MC-Unique: XUTOHp7UPHuSs36JY4iqpA-1
X-Mimecast-MFC-AGG-ID: XUTOHp7UPHuSs36JY4iqpA_1754662658
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-459db6e35c3so17189375e9.2
        for <linux-kbuild@vger.kernel.org>; Fri, 08 Aug 2025 07:17:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754662658; x=1755267458;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rHGDMQaKaiIFBdXakruE0SD84ayhWoaiRDliiR2k738=;
        b=e/oKdBPbugLuyqYOkv8iQZEjh8tteJE5qxPw2S9mhZl5dEbitW/GmBD2L5B8JCZrv2
         UevPyJ+yRuMED8zrVnhPHHIApxSr7zNg9W77ZBtz6dMcpTPviL2wLSRDZdzb06/7ITrP
         IKSCdh93pFBNanZnuIfEP7ZyHQQLyDGuNSXQNeCmxFF4tx/GT0wFjrJRAGLRk1C9xfsj
         6mUqWCobfoHE+GIVBaLuL6YQNThWH+cW9tBRqXihkaHLcw6K7A2khs2ISK9tFRPniVPo
         1j339BqBPjPGB4oAOe//utsPTy/B1nL/oocPhfduQSMdZXl2jRxXf97pTlPuqYmk9WMA
         kJzA==
X-Forwarded-Encrypted: i=1; AJvYcCXPStKlbfFeWMGo8zvhIq4kb8aOog4sDFHwoJxHXYeC+Y6NjblHBFVGap09YG/PZ2ocjk77fMbmF7nDgH8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbR54WkHJO05ie6c2Eqx/9tvtD3ZZiziqptrKfmlLteraMA1ac
	G6qfvIf56LQL7OXp+KkuR0ljmcd7AynKWFVzdctWrtQntv4WYOs3IHUb3PhOilGbJu4PUouxUx5
	No6Y88us6cQBWVf8ZX3UB/c+Fb6lDcu3YcmfWhGy9Ap62rbeHeSocCculU0Mq4+e4aw==
X-Gm-Gg: ASbGnctmlSpklxkmqGVFMVB2zlmEJVnhOFGWdYJ+wYHxDMlT47tsLTN50s4C+I+CTP9
	Pemm3SYXJNgNIWP953N0ASb5x9i6FRZ+/gXdErS0CnHULAxg+pagI6N3ZBGSAPiuQA+eoeiKns6
	vRQWQD8ihcye3dMlkbWh5pG/ltGgTj/T+BazLTsFD6u6/wGJ1kxuBpDuq0or6x7oX1FX7D6/x7H
	9JDXAR7yyLheypBP0pp3ENij01faj2qFA9ytMUYm1gasTgvBJoXFeWNtIeBap3ZHnVJZ2uHo9B1
	kDhTdCheLGJ9uV8Jxb7IiNhd+pd/TNQLi08jXQ9riFhIvRmssIdjnhaJ6d+wxxKnz1L9lCQYFgN
	crJd+Y51dcpDWr8Wv34BSjOCt8way5fjnSPfkjgQPjxqmrAHE0LloxTgpEsGHM7O+
X-Received: by 2002:a05:600c:354a:b0:43c:f8fe:dd82 with SMTP id 5b1f17b1804b1-459f4f0f57fmr31634455e9.18.1754662658478;
        Fri, 08 Aug 2025 07:17:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuuPjmx204WPCEocS/DfxSAD79SuYd1SKOzgP0BMmm7YItX5BZc+qOZNBJNJk67SvuvcFlQQ==
X-Received: by 2002:a05:600c:354a:b0:43c:f8fe:dd82 with SMTP id 5b1f17b1804b1-459f4f0f57fmr31633985e9.18.1754662658070;
        Fri, 08 Aug 2025 07:17:38 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f25:900:2e1e:d717:2543:c4d6? (p200300d82f2509002e1ed7172543c4d6.dip0.t-ipconnect.de. [2003:d8:2f25:900:2e1e:d717:2543:c4d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458b866392csm157921635e9.2.2025.08.08.07.17.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Aug 2025 07:17:37 -0700 (PDT)
Message-ID: <8334f7f9-065f-40b9-9c1e-95223da7980d@redhat.com>
Date: Fri, 8 Aug 2025 16:17:36 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] module: Rename EXPORT_SYMBOL_GPL_FOR_MODULES to
 EXPORT_SYMBOL_FOR_MODULES
To: Vlastimil Babka <vbabka@suse.cz>, Daniel Gomez <da.gomez@samsung.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Matthias Maennich <maennich@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Cc: Christoph Hellwig <hch@infradead.org>,
 Peter Zijlstra <peterz@infradead.org>, Shivank Garg <shivankg@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-fsdevel@vger.kernel.org
References: <20250808-export_modules-v4-1-426945bcc5e1@suse.cz>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 g3eXuA==
Organization: Red Hat
In-Reply-To: <20250808-export_modules-v4-1-426945bcc5e1@suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08.08.25 15:28, Vlastimil Babka wrote:
> Christoph suggested that the explicit _GPL_ can be dropped from the
> module namespace export macro, as it's intended for in-tree modules
> only. It would be possible to restrict it technically, but it was
> pointed out [2] that some cases of using an out-of-tree build of an
> in-tree module with the same name are legitimate.

I'm wondering if we could revisit that idea later, and have a config 
option that enables that. The use cases so far were mostly around 
testing IIRC, where people already run their own debug kernel or sth. 
like that.

-- 
Cheers,

David / dhildenb


