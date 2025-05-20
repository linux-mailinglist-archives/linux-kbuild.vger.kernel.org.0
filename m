Return-Path: <linux-kbuild+bounces-7185-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F73AABE810
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 May 2025 01:32:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5EF9188CBEE
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 23:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AB76219301;
	Tue, 20 May 2025 23:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2cldMACw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38C1BA36
	for <linux-kbuild@vger.kernel.org>; Tue, 20 May 2025 23:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747783933; cv=none; b=gw7M8uIQJW0xFH8xKfpx2W8MRIzkTG8W8j555A6g+tNNVhYA2C5RzljodIVaiRSWmv7+nlCslL8cvUlMTVHP4EZ3J1GiouTkmdiYGPJFVVZhnJsZiKuhDqFYaVeEB8VOVDvpjbiuDFRqSNeo2J7V9wSQNFgYACUaBBOF+Dp+beM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747783933; c=relaxed/simple;
	bh=wf4VyvC+JIjLdVHfBoCymd/r07xoaJW7OHnPpflAdIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AF/gIiVxVNnNul1yykuU1WqPiVHmxsARjh1MDtiRENljOHTdK2ds627aE9U73D1z8WjaMyrF0PoJe5qrtMm9tqzwDLVGb/DmYzkjUxDhgAQ8K4k6hba81E1uuwH+ZD0AzNtdL54LjC+I2IdoyIZkUNPxJl87pkcHdPU3u7BexhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2cldMACw; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-47e9fea29easo1460391cf.1
        for <linux-kbuild@vger.kernel.org>; Tue, 20 May 2025 16:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747783931; x=1748388731; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gXx8k8VxN95k6BKx9iI5h3D9RI7z26q/qwKyH1DfJ3s=;
        b=2cldMACwT9BX1JXnd2+GveeEghSGu/kZDBl7eKTc49zs2ufxXwgp1h5fhARWbHXeMj
         IyY5y/KdmV5GYkjMpNvjgDOpYp16CF1IATsBg/8UUY5oF8hMJucrgBBl3EvnUwwSFjVd
         uMz5+O+DDrttPAjeLxKviTbhjzW/FJcovbT/L+dVuqRJWqsst32mL5849weGxdXqp8fK
         tpzhmncL6mJ0Eo4wDidUMzfB3YCziHhCrLp8fi51J/JmuiF433uJWTTJpK7djhnuaqVO
         nXFbMsfHB1LfCVW564vL0syGyxb94ItAUa5EgZ0l/9yjKbdi+ZerxZkAUIUlQOF6C5R/
         3FYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747783931; x=1748388731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gXx8k8VxN95k6BKx9iI5h3D9RI7z26q/qwKyH1DfJ3s=;
        b=McyZTlPClRLqBxjzFa320Q4AQDVF5XpZRS8wQXbEDBsRMGqc2ZUlrvUK0/9iKZiSWh
         LW8/TopY9PwIBUQxZR4j0w005qRYSmEHvnPr1hsERsTmgyuS+cj74FlW7BJGI4LQXsW8
         yBxeRlZYDL4iM0VFWCftK73GUxMecfl6wt5qCtVm4QASKvddY1VYCJindvrN2lBFKyfj
         5LSptDQSJGmrTyl6o3lI8iSORX1YnH1tKXQV5rgp0vMX+47LVnTWkm2kfJGil47Bzst+
         9Z3bkO46Jv8UKjz30POMnd0ZEpu49U6ckm1RmuK9eBKOnjBJAWRJyzYJmxrc7cWjNoCH
         WbPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeamuZb98GTPB+2WgdcfRKolsTn8Gl/SOfbiDNd95Ex4hp9C6/7fSb7BO2ltrTIRhikSC5uRwHpm3KYDI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/GgHvH8W0cmtN5DJ/7bg7ikNyV6vmkywfNtCBtC33uZo5W4xV
	/y2ygnZzW8ud5JgvQZG7f0gs3wYXT2BDVTASmgDhW5p2QLy5W4ETjcKEEEZ/35XEp7FazISEOcL
	qDuG7hcDGBbDTc5m0gCAkNfujrPCGO6T+kbCt6WYh
X-Gm-Gg: ASbGncvuTbqcHDIDYL1mtXaoeEBn8w6+iYzIynoZ3Ta0cAhgVJb6Kxei1Rkj9Gmw3oF
	VrtPuQBSXmLvzxggVim1IGj4H8UxDHF355ureq+hDErjM5AEHb0Tx3Ne81jj4bxpBWOnKS2Lcuz
	d7QR+1yWWZJ04m7AcCsOgktpSmHkQj79AGkylh6SbPox1paO50GPyBhOGxYI3FsIdOFDpRrxUwz
	iW3yDuMWOg=
X-Google-Smtp-Source: AGHT+IG7ctLKjxcorUtE23OtbhYrOwe6UiNU6EUt4eAGyHBVXzrPL+z64K2s4IULVDAf1a1gh2p+DCkA7U2eGkc8cvA=
X-Received: by 2002:ac8:454c:0:b0:497:6e9e:3953 with SMTP id
 d75a77b69052e-4976e9e3fd0mr10272131cf.15.1747783930432; Tue, 20 May 2025
 16:32:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJDx_rjX4Z3QvoFDnQ7qH06x+Q+pTP3bAyLv2GD2C+CoWu9haQ@mail.gmail.com>
 <CAK7LNASeN7za4eq2rsTO255y2A6m9uzxec-MSn=TyM=qD1iEOQ@mail.gmail.com> <592eafcc-6460-4461-bab7-3c709e13d3c0@suse.cz>
In-Reply-To: <592eafcc-6460-4461-bab7-3c709e13d3c0@suse.cz>
From: Juan Yescas <jyescas@google.com>
Date: Tue, 20 May 2025 16:31:58 -0700
X-Gm-Features: AX0GCFuvT_B-MRyVxRKso63oNqe0XgnxQ_GNK5OfKcbH4RaDfrvUK8oZgqbfXnc
Message-ID: <CAJDx_rjKJA7cvtX_ugGg7Zp7NFs9U80ijpBoWmdcptUBhJaUdw@mail.gmail.com>
Subject: Re: Kconfig for range is being ignored
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, 
	Suren Baghdasaryan <surenb@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	Kalesh Singh <kaleshsingh@google.com>, Isaac Manjarres <isaacmanjarres@google.com>, 
	Zi Yan <ziy@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>, Minchan Kim <minchan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 12:01=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> w=
rote:
>
> On 5/17/25 08:45, Masahiro Yamada wrote:
> > On Wed, May 14, 2025 at 5:18=E2=80=AFAM Juan Yescas <jyescas@google.com=
> wrote:
> >>
> >> Hi Kbuild team,
> >>
> >> In the patch from below, I am adding a new configuration that depends
> >> on ARCH_FORCE_MAX_ORDER.
> >>
> >> https://lore.kernel.org/all/20250510010338.3978696-1-jyescas@google.co=
m/
> >>
> >> When ARCH_FORCE_MAX_ORDER is defined, the max value of PAGE_BLOCK_ORDE=
R has
> >> to be ARCH_FORCE_MAX_ORDER.
> >>
> >> mm/Kconfig
> >>
> >> config ARCH_FORCE_MAX_ORDER
> >>       int
> >> config PAGE_BLOCK_ORDER
> >>        int "Page Block Order"
> >>        range 1 10 if !ARCH_FORCE_MAX_ORDER
> >>        default 10 if !ARCH_FORCE_MAX_ORDER
> >
> >
> > The logical calculations such as "!", "if"
> > are allowed for bool and tristate types.
> >
> > Here, ARCH_FORCE_MAX_ORDER is "int".
> >
> > So, I do not understand what
> > "!ARCH_FORCE_MAX_ORDER" is intended for.
>
> A kernel developer used to program in C can easily assume hat it means
> "=3D=3D 0" :)
>
> > You are doing what is not supposed to work.
>
> It would be great, if kconfig either behaved like C here ("cast" int to
> bool), or warn/error out. Silently treating such tests as false isn't gre=
at
> IMHO. Wonder how many other buggy instances we have now. At least
> ARCH_MMAP_RND_BITS_DEFAULT handling is also broken then, as Juan has show=
n.
>

I agree with Vlastimil, Kconfig should warn/error out when an expression do=
esn't
evaluate to true/false.

