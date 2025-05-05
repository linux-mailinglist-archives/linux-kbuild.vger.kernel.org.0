Return-Path: <linux-kbuild+bounces-6933-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FDCAA927E
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 May 2025 13:57:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E0823A6C77
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 May 2025 11:56:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A4BF2080C1;
	Mon,  5 May 2025 11:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="f4r0LqxB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BD6207A08
	for <linux-kbuild@vger.kernel.org>; Mon,  5 May 2025 11:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746446182; cv=none; b=I7EN+SjWTz+qmNpmC97uKGz3kn+bss6cqFmHpHBKBbr/TEwLW0FFXGA9V0enm+Vk8z7HiXoYeFzR95WMK0aozTwwBrwISD+KqJHmE43mllhbcaFKKT5hgmbtLCnl3JDUtaoEBQowNnuWOOurLf047W5FH9SR9mCCdCGnBBEr2m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746446182; c=relaxed/simple;
	bh=jg5T4KVLUhTRrdF939eO28MIkOvTR/v7HOz5BEHUbdY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EiekRBxz5OecJto0enzWGM3ujiqqbaKVHTNHlN2JEdyQs1B7zMoyF3e189tqECN03Zo3UXsTHLJqi/FGqtRcbb3Exru/J5w9VBvbbg+vHsup2Y2paTu82qCiz2Wi+LRHR/1f7MeSUp3F8xBumxsjJBtkYuphkXL+O3Ab8UIrERY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=f4r0LqxB; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9ebdfso54377a12.3
        for <linux-kbuild@vger.kernel.org>; Mon, 05 May 2025 04:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746446179; x=1747050979; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jz68Uzn+xh70gzvNlWX0MbH0mKkRQyVFSCgz33BJirc=;
        b=f4r0LqxBXh6i+rDxN+IG/2eOhOZ5I73nXOkeVS7dPspT1gBn6Obn0xt8LjEADAogjQ
         F55krbcKtdSvvVioWONZdrr2NqdeXhFXu7KrrFA9Fs6+5W3reD+yoFWZBGEYiqrKA9xy
         kxDbcKVHlNGkC+B8kZF7RZ8/yxWFjFF88ymv4w/A68mQaW49jvDx6+3aNSY8ukQezoZC
         gHFJ1g20wuGu/5XgS7EYFLi5S3OFhPfPJWFzodeWVY6Ql2d+UOzRwls80rCNZGVcisvi
         C2p9TdfuuJkmHVZijAu9/sjztJ8JiDjHu7L87e34kjPG3UdwOafc7lVG1ARXjbMyLLe2
         yTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746446179; x=1747050979;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jz68Uzn+xh70gzvNlWX0MbH0mKkRQyVFSCgz33BJirc=;
        b=wy+TNaZwJMYgG5LlNswJszaS0n0NWqTt3rJf8rXBJL53uFpKJL0+j0F3sLsRBJ9PTG
         JzSkben8wXeRsMU1aYlmj3toX2ptMTiC687MdzA1m+KE14woN0pJ4bc+DTVlQoUerLGc
         3RyeC4AJvUPInJVMH7kL9TH68IGcviIhwGiF3x5eVCn1Klp4Da9MJfAQf9JmUhCI0HA+
         6rjxuE/l1UgJemWhH0A8AsugSjJIqoe6kAlceOSm1Tysfs27kBgIZCQYnJKY21IH2/4Y
         ZI+K1X+iHLVesaMm35YhfEUearGSXDYvG2NtV6xRmK1Jx4vjPN0YPG1CjDmGCc3QFS4G
         YpVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXstRT6buQLzMtbabnqB3aYKgPBHKbNxhxa4kJVbfhwdupnq79MYngz9PlSFF9QcvZhul7N9Fk41S/0/Og=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXpSpeERzYopCR7mh8G0ZqlJ92OulV9yRUyaABdinhwB8SGFmd
	BcK6ny5CgkyRoF1cqs/G8vmrYP8XPEgSrr2VqZTnRX3mNnH8ryEDEqFzy9KymKM=
X-Gm-Gg: ASbGncvc5OvBfbiCPouNgs8BlsuwRqjEgkwuNQmwO68XQnxtRDb7ie4/Q4JpYukrnnO
	68LBNS3wNXvyzrHb8EIEn03Nx/ioFREEKIT9jXBL+yMFqXikTh1xm2QqH/TiBTqloC3BEsdZObp
	kKt6WZljmK/nS6q4PwHczUhY2ZPUvxwsKrBuMNZd9plm69tl0qA0UkQ6uRNj76dJUH/anmejAej
	7mQigN/PT877V3ny9udnonlpukbaw51sAbwHUiiW+zw7osAYartkzhxSiP3oJfrB3q8zrs48GzS
	KvpZZkFpt3W0qelqGa4WFPwPo3HUpAaoHcR/n/qh8fw=
X-Google-Smtp-Source: AGHT+IEt+litOx42ovMOLvvM7tdUauKBNtX/69p1CCT5Gm7nZ2lwM2QfZn0MkxZtRqgHhhDURf79rw==
X-Received: by 2002:a05:6402:5215:b0:5e5:b388:2a0e with SMTP id 4fb4d7f45d1cf-5fab056de14mr6858941a12.7.1746446178782;
        Mon, 05 May 2025 04:56:18 -0700 (PDT)
Received: from [10.100.51.48] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa77c04411sm5281064a12.67.2025.05.05.04.56.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 04:56:18 -0700 (PDT)
Message-ID: <18f96f82-8d26-4773-878a-5110b19d42f2@suse.com>
Date: Mon, 5 May 2025 13:56:17 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] gendwarfksyms: Clean up kABI rule look-ups
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@samsung.com>,
 linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250430214049.2658716-6-samitolvanen@google.com>
 <20250430214049.2658716-7-samitolvanen@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20250430214049.2658716-7-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/30/25 23:40, Sami Tolvanen wrote:
> Reduce code duplication by moving kABI rule look-ups to separate
> functions.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- Petr

