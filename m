Return-Path: <linux-kbuild+bounces-9456-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A582AC42772
	for <lists+linux-kbuild@lfdr.de>; Sat, 08 Nov 2025 06:09:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 51C564E3DFB
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Nov 2025 05:09:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16BC22D8388;
	Sat,  8 Nov 2025 05:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xn/WuxlE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AB92D7DE1
	for <linux-kbuild@vger.kernel.org>; Sat,  8 Nov 2025 05:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762578543; cv=none; b=Vi52cyqSfpQSzb9mDecRnYyVwc0SW32mVFaw1GwFAzEJgxkb0QnEI5lzClA9O1EmL9t8ybcZqvYSPKZCt5fCCOvH55hbLf7G4OhzL/aIgNoEht6DRT2T4RWZcHcKA/cO558NtS+V/HWALnko6H2G9+4gO6DXzym4STgw5SScWZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762578543; c=relaxed/simple;
	bh=Fz3Y0iZrjkcgBV3u4aAleACcsYpUZ0teG1fAfHbW+Kg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dpz77w3plQCR3smkd8vPOo8evaW0qZ4jrrc3YSMdRd/yl/0c6KIiPH+G2tWS3YysfrRPEOHDqKckzEHUT59jtjlxVCKnhgvnLcOMAncVlTVcc1cxs2KOY0VpXJalBxR5zkvQbJXpHv7DOry+MWt98nCmVssZIqh8T2l4W94RvmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xn/WuxlE; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-297ea936b39so449785ad.1
        for <linux-kbuild@vger.kernel.org>; Fri, 07 Nov 2025 21:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762578541; x=1763183341; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fz3Y0iZrjkcgBV3u4aAleACcsYpUZ0teG1fAfHbW+Kg=;
        b=Xn/WuxlEdnMid6ziRjW9qZ8KrwXxgw8O0AVDh/3Y1NhQyuX4NTbIgJgRWyR0GT3JkA
         OwU4S58GNPfZvVQOnXzn0GMTJ9iLB9+BkV/wTHP6akkwzs2bRZzTEj8XP/NGkRl6y4JL
         Q89B0PntisN3VdGTzvjuy6zEiUPtcubBt0CmuX9xtITBxCvRxviDQmBjGfp9JqwoIusA
         ytWZi546J8jvO6VsTaAu8txJHZNpgxUBkRfQBp6CmfPKUepAKXE2TdGZE+YpsSYvdfSj
         lZUCVMRDyR7Lmd8XAI6gUWi1z6cSOW271V7p9RAD+IHYBkl7eJflA+UWr3XJl5yXwxE5
         ye+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762578541; x=1763183341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fz3Y0iZrjkcgBV3u4aAleACcsYpUZ0teG1fAfHbW+Kg=;
        b=xHVh52png1SCwjAHlmtrpKfFenaNIoQTzM9xkYVhMm4plFR7tFK3VmH49Wv8MzI1xr
         g/vbq8M4cydKYofpl9iEzyQG9wT+sWn2MmHhaLaFYstMtVU7i7by1rJf/6hLldM5hMdJ
         rWR64/VhDu7pHRNXvxbrCfVNvGA58NfA1Iu/VqpsEsgajZiil/U9wXyvudbKy8TFRy07
         w2IXsAnp3k2ZER8VLkzLup1PIkEaD/x0RwogIlp3AgCwBb7vFI0ZQHaLaXHRhgw5nebb
         SeaNn2TrEo1nhwOj7v2fGf5LEShFc9yE1TxeC9oxMWk6quc/fyYXXBFHp/GcJron9aHy
         3ZQg==
X-Forwarded-Encrypted: i=1; AJvYcCWGEGaqauG7N87BpoezXzd8+HZtw7kT6QR4qznuCt+m8GUB63U6B5C/M1H68Llxk0TpbnqK+I3WY39Gz00=@vger.kernel.org
X-Gm-Message-State: AOJu0YzF+tSPBQ6Z5eXIpffvpOs8dz3+ZO+MnlqWIHB/E8Ygl2C0ikwv
	OmZb1ZbCl7dXqdVJJU7I40xQ2Hht/le3jlhLB3ruii5VF4MZqed+tQbpp6TUhb4NGEA1Ja9IaGB
	RlTUKH+Pv9epTZQ/4oYeib1wGZHT/F5M=
X-Gm-Gg: ASbGnctlMnWgmFR6S6cK58AdX0zlLb/82IIDWuJGQM0RC7juwKgGk1exel3470ugUKK
	jjqRwfPDrirZv95ymNPFcm5gvqZ8V1qBXm80sJApg5RQvTk7l7xVjVAgacfzkDwG/XJv2FeHNxT
	Rt2yHVzpXFDE19IuoTSVsz4RQBogVoRAs3LXcPyf3rIEVsVrfxcMkRPrhKG0DwIOi5vrFW6eeH+
	jYswm6TNCgC2QUBuw3UlODHt6YbUp2UpwI9QtYG5L6oLGPVK+q6vCOie5BIDVB/vZwu0IBkKtQk
	X7+ZFn08fo8jag3G7TyLR5FL25SaxSs9inYWX2dZRNGXn8T6BXBiy2s+G8q9P3RNOHOHy2eg2JB
	VIYge4slcYi8VZk2EKKyqeVqa
X-Google-Smtp-Source: AGHT+IFBuCL5u2fMr5uQrCuCYqh69grOQb2YzSXclEu4sAxP/EhHfjXis6PkPrFs0zQu0KSNoHuxy2oDP2s1+XJtf2Y=
X-Received: by 2002:a17:902:ecc6:b0:267:8b4f:df1f with SMTP id
 d9443c01a7336-297e561612amr10933605ad.1.1762578540720; Fri, 07 Nov 2025
 21:09:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b8c1c73d-bf8b-4bf2-beb1-84ffdcd60547@163.com> <CANiq72kX4Yep3pNVq8Ge=txQbPnMO=zKsci5cPgz5LDS=D6NoQ@mail.gmail.com>
 <CABCJKud0G+Xh+Wbtg4SDGvk4Yh5nmt5YgHEPj-H0y8GO5R3Amw@mail.gmail.com>
 <CANiq72mw66ADx7LoUuqY6h9KCU=uFzcNQXZ21kMP7jBjCyyaHQ@mail.gmail.com>
 <CANiq72=OFO8fBpJ6xvGunYrx5hXfcjQJ=YDqFxtMPWDzfzwpKw@mail.gmail.com>
 <CABCJKue1xeY7CGHScG04PdHT6TOPgsOpZVKWwgzO65qwAcbEJg@mail.gmail.com>
 <CANiq72ncHgjjJ_c2fdTgOO9LxmmotRS8S6pwyckLmPJG_4GPNg@mail.gmail.com>
 <CANiq72kcRsTWPhQVJ18P6RUxL=+c1Z8BJkyK_kRR8EBmmH+cWg@mail.gmail.com> <20251108044206.GA3038215@google.com>
In-Reply-To: <20251108044206.GA3038215@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 8 Nov 2025 06:08:47 +0100
X-Gm-Features: AWmQ_bnDmDiv5nyPr_pmQnVmI3i02RmMKtbqFEl5H9h15wAaaATcklkG4Em_83U
Message-ID: <CANiq72mLbEVqX-uBtqy+_wru9CRRb3PL3qFqYEcjpZdNyZGd2w@mail.gmail.com>
Subject: Re: Only rust/bindings.o build fail on rust-1.91.0
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Haiyue Wang <haiyuewa@163.com>, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, linux-modules@vger.kernel.org, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 8, 2025 at 5:42=E2=80=AFAM Sami Tolvanen <samitolvanen@google.c=
om> wrote:
>
> Ah, nevermind. I was looking at a stale object file. If there are no
> exports, we should obviously skip gendwarfksyms.

Ah, good, thanks, I was wondering if I was missing something.

> For C objects, we use nm to check for __export_symbol_* symbols
> before we attempt to generate symbol versions (see gen_symversions
> in scripts/Makefile.build). We could do something similar for Rust
> objects too, or just bail out early in gendwarfksyms if it's passed an
> empty symbol list.

Exactly, that is what I was suggesting in the other thread about
editing the `cmd` command or directly teaching `genkallksyms` to
auto-skip, but I didn't know if there was a reason you didn't do that
originally instead of having (some of) the `skip_*` lines in the
`Makefile`.

If not, then I assume we could already remove some of those lines,
e.g. the one for `ffi.o` (no need to do it on the fix, of course,
better to keep it minimal, but just to confirm there is no hidden
reason there).

Cheers,
Miguel

