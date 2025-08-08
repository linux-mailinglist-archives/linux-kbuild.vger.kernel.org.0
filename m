Return-Path: <linux-kbuild+bounces-8326-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1948EB1EF12
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Aug 2025 21:54:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18C3B168455
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Aug 2025 19:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4E47285CA1;
	Fri,  8 Aug 2025 19:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EQJorV+1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654AA1A2872
	for <linux-kbuild@vger.kernel.org>; Fri,  8 Aug 2025 19:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754682869; cv=none; b=RTOO3k6fK5lxX/xRLazlHIF+9ey4wB0NmwL9wXnBYSslVKm95BEAwkv9tT+HQkQMHKPVV4nI+P03Ya5B+PYQDbrtynW+raot2lftw5tMTTQYFn2MORYmoEgRW7AlyECGJ01u+KsOMuCk2VIg7XqBnDbUvSGsPMwogAcqNVuIhBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754682869; c=relaxed/simple;
	bh=r1Pg2PSODupAIiY9K86c3sCv8upmobPOHNwgqGYEl6I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N/MerhnGL7wZpn3CJtOsRUtS0yrk1n2btZvUYeJ6jFUYQiT79sbBBaBhC3XW78rAX5OeVuASN9abOM3JXZjvP3Wawr/dSmFLvEPM8V2WFX45kNf5oMprmBKfDyznqnkvXQGQyoKxPml4aOqPXUSAwxLXje1jMnA8NGbO+Hibw98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EQJorV+1; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-741a1ee9366so1427043a34.2
        for <linux-kbuild@vger.kernel.org>; Fri, 08 Aug 2025 12:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754682867; x=1755287667; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cxgzvE4t/0k83Zs7bUqXou/HDpBBbBMJvP0jy7DXlIg=;
        b=EQJorV+1m6Y9uNWWnPSunJbTDq2PchQvIr3dfViQC0rtKH+uvcWYKaqx5IQ1A8EHBP
         bunysSpfboP8q1S00GIgU3CPQwSAxwTEbC69uG1rrZgiq3ELMkVNcl2pHlZyLJMZHG35
         XA1SFkigUW6wr3ANHTPbK1dhmeZgGX+/JbYrj9vMmlWJTFRUzqlYOuhIzhy87GqM+42d
         2qCHmXiUcuogkSFj2fCUhItH0+oX4yYfcHrh9rs+E5xglHVcIHBm3DQDsXb4yNQ74mEI
         00oYm+Rr1l01s0AO0BoZNOO1wgWLOZrK1L8dPJJ2EzpeR2hszc6nh8zjOtDcDX3yMyzk
         QDLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754682867; x=1755287667;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cxgzvE4t/0k83Zs7bUqXou/HDpBBbBMJvP0jy7DXlIg=;
        b=BSOUQltQJVvEgKljQkC+0YMqkMpC8i2FCRNUoK4o0FRIy48OdyOLlmRtPgKpgYKVC6
         gPPrvOEx/Cc61oC2h4U/Q8EKXCgO5oRSp9YpuGMmBG137hT+LF1WR2vldUBJ6S2U4Fz7
         tX/ULeKAYiAGJg6iO4DfovkpyUUo6RFse1dQ+CRwAgzUlFA+fhoU+7ICA+lZH3PabMCD
         qEDcqFmtf1kh/H4s+BWF3PD2pNDxAbBY4pzoHqneHaWmRFHM+XaWThADzeYHxtHw5hS3
         jWTHgBd4Qrol6p6vFLhF+n38P8wD1HbZLIl7arSR4bhYT5613QBR3BBXnwxu5jQfmv5B
         BJOA==
X-Gm-Message-State: AOJu0YxVsbpmh2fvxTpSqx3r2XCC76q5TsV6KU0YmAL/jMi2jbBx7sgI
	ZJ21e5eANaYg6m8NIzDgP4frdcRionxd8aYo+ZAiUyeZNqvbtc+ZGKxAK8WX1e4HUIShqHdFtRm
	ecSG/dMhD1KAPQl/r+7EV2z82jxFvcaDRrg==
X-Gm-Gg: ASbGncsd9VCchSJEQLPJwYXpBztxyakSTVIy4XmzfMGheEEZFDmgUhcTaxynmZEXWHN
	cbwLSi8ahGOru3Y3AuTIbj4uFc3TEoocCXJ5Ip9rFPXXYfC0aB98jrnS4JXialOeYWyFFT8/dWC
	pSYqfhcZNRGiB35gYYZ0R/P8JmG2rdbO4safiIVDaJVQHqeq3oib4QuQZycOCNYkq3JULZbkc1L
	e/6ztY=
X-Google-Smtp-Source: AGHT+IHt9NlpDEuZ2XMSAM007AEqX4dmZHEHW2FIWqo96xwlOPJRAKtXgmfCpSnsqpiwz6drOc2j5SR4xNom1fo49No=
X-Received: by 2002:a05:6808:3089:b0:434:11ef:81f4 with SMTP id
 5614622812f47-43597cf0406mr2168481b6e.1.1754682867246; Fri, 08 Aug 2025
 12:54:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGRSmLvRaFfLG-ksN=WHe3FrH4DOrcJud5BZynGhsrYc8c28ww@mail.gmail.com>
 <bf26afd4-7c4d-47ce-b294-093c15e31ec0@infradead.org> <CAGRSmLuViYdzsoPFtZ6PE9_Bo0VZB0Ccbs5c7Sy-bpct9eXr3g@mail.gmail.com>
 <CAGRSmLsxTH_sq6Vm0A_v6m0u2USrG981NhBoyJCS1hwY+bENCg@mail.gmail.com>
 <4cdde960-f897-4a17-8a5b-18fbbced4da1@infradead.org> <e7a71f76-ce38-46af-bc81-997f796ac911@infradead.org>
In-Reply-To: <e7a71f76-ce38-46af-bc81-997f796ac911@infradead.org>
From: "David F." <df7729@gmail.com>
Date: Fri, 8 Aug 2025 12:54:16 -0700
X-Gm-Features: Ac12FXxJNFVlht7FBC0n6OpRxa0wKe9m4Py82qOGiOKwWa1jw7eNDVE3J0kMXjk
Message-ID: <CAGRSmLu5bEwLPZ+8EHZTC9MxGB0e_-HckyhYDKjzz66pgW02Kg@mail.gmail.com>
Subject: Re: Unable to build custom amd64 module.
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

I'll have to either patch the makefile to not use objtool or replace
it with an empty script.   The highly optimized asm based object file
is binary only and works as it should, the call is expected.

Should I choose the route to patch the makefile, which item needs to
be removed, I tried a couple places in makefile.build but it still
wanted to call it.

This is gmail.

