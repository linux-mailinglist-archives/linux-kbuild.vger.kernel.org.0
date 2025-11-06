Return-Path: <linux-kbuild+bounces-9434-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0F0C3C487
	for <lists+linux-kbuild@lfdr.de>; Thu, 06 Nov 2025 17:11:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AEF784F027D
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Nov 2025 16:07:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6F26304BB9;
	Thu,  6 Nov 2025 16:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XDI5yXsj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9B633C51A
	for <linux-kbuild@vger.kernel.org>; Thu,  6 Nov 2025 16:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762445264; cv=none; b=ldbfsiRUsgviOpFqzKe4izEwWZp6OVFTvLncUjf09UbqrrTt52pPDG8ZErE2uA3Q4FKdiX9jsSNRE3yRIft6KrcDpprapTaRt/Xqk4I0zYmT2p713iAD+hc9JiKC+L+rMiQKYY04HdH6+9jdEaO5Q+lWEI3kSUcqvNv13j5tWzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762445264; c=relaxed/simple;
	bh=Nzzlrmg2j3/3q8FevLWWH7MRQgKjJ5IbIXmjitSDalA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WtQZSWh5awkGHVD8EcXil2fd0K19YZ0WgmAQYfvrvozl6jnbdqeKu4q6Httd87Guc3/n0zeQ39S++GkRcAfwauAkn6owEdVxZepwbkcWOsUsLRCnmvWIr3hb+6dGzYQ2eKI3ixR6VHUJpTH9yOv6uTHSLU7W3k5YodCOhFboLtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XDI5yXsj; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-27d67abd215so192885ad.0
        for <linux-kbuild@vger.kernel.org>; Thu, 06 Nov 2025 08:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762445262; x=1763050062; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nzzlrmg2j3/3q8FevLWWH7MRQgKjJ5IbIXmjitSDalA=;
        b=XDI5yXsjuHRIBicHR9HeQMGoU/S5kjM7KMV74m609W0w/A8LAun0LIPRUtdhNIiCrr
         fm5LHoj9uAHVrTSX5llcxtnsgq0EZY5oSfSEsgtWL9Pm/oILAgfhzvJNl+M3HU/V+UW5
         8MBmTO955fThVjjoZikeDV6IPq5DLVOxyuV5v6tQIIIJpXK4uzHTTmSpr1ifi7dZx61/
         l8k2Q9HrczAYndaSV30cG3ZbAsPwkwg933qL2Qpnls35nFKcbAZjc/adVqy2BeRZKX/u
         ijdbsZoGhCJL4le3ATeOS7EZ/O/K0BFOBs0Bq1jr82acTWCx/uuIE1/5PAp5gG/z8Ajz
         9Gug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762445262; x=1763050062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Nzzlrmg2j3/3q8FevLWWH7MRQgKjJ5IbIXmjitSDalA=;
        b=Eevbroj9z5VISBKTiJ1k6VUlpTznGkaNq2yoLK4b/4WXq1A2X4j0URl80mX6LcqWFh
         +P+Z+pQNoVXB8tMtqThAeOAhkE8ZQ3jhZ1luEdn69k79abGoCwb5QgNTp8C9sQn+y3o8
         wLX6gtKt8ymTNfbYUaggYSaeHIBIAJNsh7eVR+ZPHVkzUeqP6pTvZIFvoh5PAPDFbpvg
         Ktp/wB2muLxGM3kZ+EWdNjlak2Nd5CLc1UXQmjpP6jEIzLYmtMwQUqPwhgOCc86b1w1k
         TBEnejBAIC0l1Zy5DouVoNJdoeX+dHayoaj/fA05EYOWYtf0bHUo9l1oxUw4tCtQzLMl
         zq1A==
X-Forwarded-Encrypted: i=1; AJvYcCX/YLsN2+qR8rd9t10+MYOAnTaV8TepLjjS4+EFMqkPmQGIwLPxvInthfGZSc56CF3zKc1wNuQHpoTyNrs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5hAy1dsJCB6zJANCADR4L/Bzyr48qzy7DLCjPN2pyvAb6YxXU
	/aTYZPod/Cv/ws7wy2FqK/aolBNRR8b0bMIeN9xwCFjFCa/geivXftu6ed02KP0mqOvm6TfkMt1
	sUO8WJFgxwXJiSutIWC1myrvD0675+XZwdHkXgOLd
X-Gm-Gg: ASbGncs1okBO+A0w4KtCGn3TJ04KjAAFFT58zcDgjiXWuA2hmFHi9ZWBFBSdUot/5rh
	rwcs1qdAf+4MqSzU9ZW5/FuXb2UOEhG4Ak+jIOfPH5PZrnqnmrml2aIZmAuJhdd7eOVC2bM4BfM
	XGuN/yOPKpSFnNd6T412smYdaFyETTZgs5qMcxOrxTgoiqGYBzo+SSE/b9b5uuBoBzUfbS9MuH0
	yROCrnfwmtKnbTSRV7PpkRrBGBUAtBtw7uQT44NcYKJ6XGkV8lGcn0FQyFquQJ9BnaP
X-Google-Smtp-Source: AGHT+IGJrSQnF3wP8OZ9swEpkYM6kSGamHzGXGAVorA64fWZ3wYfYUNWQRnDULUAfLehZdmVqoWOJHEZGY0/oHgrTL8=
X-Received: by 2002:a17:902:e885:b0:290:d4dd:b042 with SMTP id
 d9443c01a7336-29655c7b81fmr6092435ad.16.1762445262132; Thu, 06 Nov 2025
 08:07:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b8c1c73d-bf8b-4bf2-beb1-84ffdcd60547@163.com> <CANiq72kX4Yep3pNVq8Ge=txQbPnMO=zKsci5cPgz5LDS=D6NoQ@mail.gmail.com>
In-Reply-To: <CANiq72kX4Yep3pNVq8Ge=txQbPnMO=zKsci5cPgz5LDS=D6NoQ@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 6 Nov 2025 08:07:05 -0800
X-Gm-Features: AWmQ_bnwLdgdkHf9H1YieFCO4w6r6305meY5Ank0AAAGt5lDH9YzCvkKH09X7BQ
Message-ID: <CABCJKud0G+Xh+Wbtg4SDGvk4Yh5nmt5YgHEPj-H0y8GO5R3Amw@mail.gmail.com>
Subject: Re: Only rust/bindings.o build fail on rust-1.91.0
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Haiyue Wang <haiyuewa@163.com>, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, linux-modules@vger.kernel.org, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 6, 2025 at 5:57=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, Nov 6, 2025 at 2:08=E2=80=AFPM Haiyue Wang <haiyuewa@163.com> wro=
te:
> >
> > Strange thing is that ONLY 'rust/bindings.o'failed. And if I add
> > '$(obj)/bindings.o: private skip_gendwarfksyms =3D 1', rust build
> > will be successful.
>
> Thanks for the report!
>
> Would you mind copy-pasting/attaching the your kernel config file
> instead? i.e. the `.config` file (the `rustc` flags aren't the best to
> reproduce the issue).
>
> Cc'ing Sami as well.

I can reproduce the issue. With rustc 1.90, rust/bindings.o has
debugging information, but with 1.91, it no longer does:

$ dwarfdump rust/bindings.o
No DWARF information present in rust/bindings.o

Sami

