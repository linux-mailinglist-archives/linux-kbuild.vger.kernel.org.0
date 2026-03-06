Return-Path: <linux-kbuild+bounces-11607-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCdcNncZqmkqLQEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11607-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 06 Mar 2026 01:01:59 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F876219A26
	for <lists+linux-kbuild@lfdr.de>; Fri, 06 Mar 2026 01:01:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D31C53006B08
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Mar 2026 00:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70EA716FF37;
	Fri,  6 Mar 2026 00:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mv53he1W"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AC82745C
	for <linux-kbuild@vger.kernel.org>; Fri,  6 Mar 2026 00:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772755274; cv=pass; b=P9oky/lFQrEssSSwYbWEr1u0HjUNLWoVxCAXr6RVfSmyZrywwDCJV0sB65Qa4eNA224KO+MjYZKLHvDjQhGGUOnMJSnNyYFwfeufH2CPwTOz0uUNXgM4ESyEucTABZS4yFRP351h/7YevGa/ifaXYHkRw1sdHcpCp6H17HY48hA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772755274; c=relaxed/simple;
	bh=3qEbBm1jbPyvcyzPvbQ27b0RLrReUvTwWMgymBGu5P4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L1GpJp7Jj4nglFezeVN1VK4X2YDe+YjLcO9rfAOzvW9FDf+MhKSwuc/BylWdz+JU2+fpu+DeibyMESktwzlu0M1UTRnb6vp0yxg48FwLaXiyR5zlan+g06W9Zg9reo4U8tIQJOXJxPDH7kqx0Q0DmV/uatBQSLaEsi1XoZvfI10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mv53he1W; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12734af2cdcso363215c88.0
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Mar 2026 16:01:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772755272; cv=none;
        d=google.com; s=arc-20240605;
        b=ljDWTIATklYYfd+Kt89MV7HGxO+CnmkkTya4DMxNvnV0V3pc1/pnQywHDqX78i5O+B
         QlpwHYVc+XC+jM6kIZvRA+fauxILlciXXLF/dt9Mq9NBFjM3xMsrbcEnrK1qtGhOLrT7
         oCwqMfLBgWFi0Txh9dN8nCY42yvBufCmxlVZD8qqKXbwWQOHiR05DSVORwg6VP2VLX0M
         msZSO7apRxC9DAbLa5S0sVW87V7NwEc7j4Hof9XrvPRV7rEnLqwW2vmb34YFdWJztvk0
         eRogmNUoG4Tcs4npI48kaDz99JdhJ/xL7385L9DIQnxI2H0VwZlmYwFBeolTOD7599Jb
         pNMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3qEbBm1jbPyvcyzPvbQ27b0RLrReUvTwWMgymBGu5P4=;
        fh=aZOuP634MViiZuBgLfqCQbIsBX29v/ebWZ/Hgte2xHE=;
        b=KO0XvahQ+fMAMRo7INEVDZso2pyjWSD3xs/vmGKKkLMdhLebUp6uaazFwZJoCrjZpe
         zKlBM89yeOvrvECUw1P2IAN43ZjVHYzqIDokQb7n/Xu18ODIMeroXR724Y2X6JkNAV24
         FyAEjeBuw2FJGN8Dh58bsaj4UpZo15pHd/Z5IsAebskmXDXD2iNOsLSmmV4ZYZtnZNv/
         ovt6alcdJAUj8NGxkoZE/b8xIWAo7Fj4HxpcJTG3+llKwrf59jsq4F1bJEwELflETb9I
         jBqrELmosll4xGs/uE8LCHDIUxZLFcTs0o4JECzcpqhk1dgEV0TpVf54XoyM/dWNcW19
         W7Uw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772755272; x=1773360072; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3qEbBm1jbPyvcyzPvbQ27b0RLrReUvTwWMgymBGu5P4=;
        b=mv53he1WEnDGV0lX+GuahMPhSpG6WxgyBCZnb/0g60YXYN6Ws0r/dNfHVwtDW1C5UP
         U2uTEh/PHvUvvisVjWf8ezIMqFJo4TTwr5dlheSoDaB4BmVVhIGBAbRFJIM7QORlAXMI
         ecAf0D96ULVsbSWvqja/T37jbRDldhcw8yiRsQ3TiH69TTJOqCMqwK6hl7XPC2NNXx6v
         iePE38nnC3Mf5ws0N8uowtH4qk1wpZdJZuTug1mRkoEqOtvSjuvjWKnjWdN5spEIvfkH
         O0Xg/2yN3NZ0QHTXD0+7kJl8chTpTfoCcpsHKsNEyuwQtgpb0YNxafHDSo0ezcAEDpQX
         A0JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772755272; x=1773360072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3qEbBm1jbPyvcyzPvbQ27b0RLrReUvTwWMgymBGu5P4=;
        b=MxrMqxPGmHcz13tKyBa5H9tKzUoca9kfcrp8jHy7ppotRZRc3z6PcdWSETRqFMjiwE
         ccmecVhPSxjgVuQ6IiMzJE23cva1klRpS30lZf0c/C7dvou/QusiCW1BHnAI/BdjS9UV
         zsx7hS5wqiFw5iDQDWI5JrIS1/XhK8IyVLFGANmZNtQvhAPlivrGRl8pbF6Dq7cpqGni
         nlL8cWXZkO97YNrSycrNhURZK9L8x/TXeBYa1eurLR5fIolh/KWo9R52gHgey9m/CL2l
         fmPKg92/uExeTP8pZecyfoY3Oobg9ys0wUAnxD/74p1n8hU6WBN31mcHgUve0z4XHNUB
         EJEw==
X-Forwarded-Encrypted: i=1; AJvYcCVfI6VUErhENmaNK15vd6yTdbDknRvtYOrsyY1Ia/b31C1Btunot5apTYc66ck9khwsw5ToZ8ula60BCJU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqz4hCjdywBLe0FHttDtL/F6jCeF37VND3XOOc2tPSp1mRb+Wb
	CesDZa/K2+eKcNj6nEjWOT3QNFg5XiRElCcffpfQQUjllbourXVBCdlT3Xf4msie+aqWRUD6qJy
	rD/12lqPGV+RYrmA3k/Sz4uc6i/9oiZI=
X-Gm-Gg: ATEYQzzVbeVXGhEFTUJZxvfbN+PMfd7L5rhtGqRxgwZ/dSO3a6/ZEswPmoJjvzaGGys
	zxFgfqbEL1mmB1Ei9idbKgBPHXZgH7UjrzFqZWbwJMm3pQvl0WFjSTBLZWhq8DVx+KdbvQD0cA1
	sdQjtIlYNVcTnE6egKDBPP3vNPCWGdUSW6KiFc+gzV+APrhYxrxusp0r7VRdfOqh7yGe4oXPwOf
	NtTuIo5mNIIL79Ln2xAGmOcYG/mrEFzgnnebgY7wy/rHk69lYPeuu487an2/ZGfqF1KwhnXRxh3
	utX5ESTjedd3Kt7T7OfvMD63m5a/jcMSNpYNNPPnFAf3bWgByKYMtv0V8SFvQ2fI3YjVDibqSGb
	AFd6qQ2rkdJlJ3xS+5wq1OzmY3CAeeYvib7c=
X-Received: by 2002:a05:7300:724b:b0:2be:140c:bc2b with SMTP id
 5a478bee46e88-2be4de7afc2mr72164eec.2.1772755272189; Thu, 05 Mar 2026
 16:01:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260218154800.367720-1-9erthalion6@gmail.com>
 <CAP-5=fXLNybYv08dDfAqAsDBzbOPzQY4EZQvdY0WZsfrMu9Yyg@mail.gmail.com> <aahEEkHP5g-T_tFg@x1>
In-Reply-To: <aahEEkHP5g-T_tFg@x1>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 6 Mar 2026 01:01:00 +0100
X-Gm-Features: AaiRm51qiqId7CqvK_sID90lFjp0_dfbyZ9p1mZ9wtbLjp2EwVVDFdfBNYEombc
Message-ID: <CANiq72mdo3TFS=t=t05Qc4RZ7a6DNayaDkXMUHBhBFixRjCVYQ@mail.gmail.com>
Subject: Re: [PATCH v4] tools build: Fix rust cross compilation
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Ian Rogers <irogers@google.com>, Dmitrii Dolgov <9erthalion6@gmail.com>, 
	linux-perf-users@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, Levi Zim <i@kxxt.dev>, 
	Namhyung Kim <namhyung@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 4F876219A26
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11607-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[google.com,gmail.com,vger.kernel.org,kernel.org,kxxt.dev];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Wed, Mar 4, 2026 at 3:39=E2=80=AFPM Arnaldo Carvalho de Melo <acme@kerne=
l.org> wrote:
>
> Thanks, applied to perf-tools, for v7.0.

I think v5 (the latest one) was applied (to tmp.perf-tools -- not sure
if that is the right place), but this reply was to v4 -- I mentioned
it just in case.

I hope that helps!

Cheers,
Miguel

