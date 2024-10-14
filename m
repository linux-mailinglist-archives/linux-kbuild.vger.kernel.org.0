Return-Path: <linux-kbuild+bounces-4100-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2895799D62F
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 20:11:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE821283454
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 18:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 594591C8776;
	Mon, 14 Oct 2024 18:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="S7obQi1R"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D43F231C94
	for <linux-kbuild@vger.kernel.org>; Mon, 14 Oct 2024 18:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728929457; cv=none; b=KyTIZO4mzVeUVHoAUHPDvpyW+SJmPdSUmrjYDY39r9kgngMkgBv1/Yb9jEVlq33h9YcI9dhZwowB0NbH35XtBBMid2e56L9YTpIRkZtY8sQSmgfisgbD8HOQJz4RS7JQPlu7hmX1FT3+ljQ4TCN76FkPVh5WPMlUenyAovDTCIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728929457; c=relaxed/simple;
	bh=VypHTcUVue86TxJAIpJGKBY4Q20cHX/mFiRLyRntN9w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kClWe3Al7yu4kp0Pypjc9qRWYFcd87a+VjxcD/vfv9xGIX63GevjWMtuRjSwq9E5Qb0B3vwLbj/2lmCw8ELycUReXqtpMuAp3MrKP5QoKLgXu9WQBgzX/s/gQCKLdgn6gRTfgV4vMOfvZIBb1Cyr1+sj60vWqFVSJmAUGTZe1p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=S7obQi1R; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539f6e1f756so1389444e87.0
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Oct 2024 11:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1728929453; x=1729534253; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pHeyIJea3ALM6cFmjzsfw35tNiBlMHJavKPAe3QhB+o=;
        b=S7obQi1R9qM3G3YmOkbmLctBRuEYeSpfzHGW7hnYs+Im1VlL5Z3w3oCQOAVzhh+E5V
         o1gs+5C/gbXSgJ3GWyDQ1W+gtz3h9V6D1COt0n/bMYBMLiCIXw0iM6Lr7t73BPhJhwts
         JFYBwoI0cpGlRbDR8LkEmq8JzIMYfbsNgg64k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728929453; x=1729534253;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pHeyIJea3ALM6cFmjzsfw35tNiBlMHJavKPAe3QhB+o=;
        b=jQ2jLW99noLrQ0KzUt9neh9N4sVVC2KgAMyXwvkrgfSlDc7zrgdtdTnCGSANz/Suf5
         yvkUWVnFQCYi88jBl4Oq3CSE5YibAuzv/Oxo4+REbkm+GLW5IPIXs8dzJ10QMSThi2cb
         OYk1suvNRocaZEBFP/89p9BuajuV759b3DWbBm32DCx3P34kZnip1T34ir/m1eSwJ9x/
         SLXp7ZOd5PiLmWoO9wBS8zTFcGPuUYOSQ8qdxb20Yx5UD56Nmlbk9zdq9ELLdq37BGNd
         Wik+qH8V7QoFSis1nhjKpX3sc6Sz6M2mfdwRwr1ufHFbIT9IlGVgVhODoszEDbZVJBfk
         dhPg==
X-Forwarded-Encrypted: i=1; AJvYcCUaMPKH8XIE8eEPx53JfgaUD7JJ6L6E9UW7y2uVUGiQTHckuEmaz6cY7M8nUF1NPHLfznNjnqrHjxMwaOk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn/EUq/xSiC8KagYu1wQjziCdyid0VHgtxmENYIQco3z0A/JI2
	ibAY1KM6mzanOHsWXcCJiMgnKvflzZyswTgCRX5eFDeQ/kb92GeJZV5pYAOiVYrzZu0x31LYLsr
	E0uzYUA==
X-Google-Smtp-Source: AGHT+IFO4gUOuQ7Ay8G2hR022ES8kmMlglTL51O2nKNq4w0OpmKwTrgyWFN1LifX6xMGv5MfHQTUrw==
X-Received: by 2002:a05:6512:228e:b0:539:e0fa:6ee8 with SMTP id 2adb3069b0e04-539e0fa6fa2mr5802424e87.6.1728929452875;
        Mon, 14 Oct 2024 11:10:52 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c9370d2274sm5226607a12.13.2024.10.14.11.10.51
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 11:10:51 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a994ecf79e7so710810566b.0
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Oct 2024 11:10:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUGslRDdwpepPmnLoZ0rP3CyUsj6NL0YBi9uT6qpPKjt2R+GTVs4tC0/im4pmMT00VYHGFS5wlIDpX531k=@vger.kernel.org
X-Received: by 2002:a17:906:df46:b0:a9a:daa:ef3c with SMTP id
 a640c23a62f3a-a9a0daaf058mr273908566b.14.1728929451045; Mon, 14 Oct 2024
 11:10:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014125703.2287936-4-ardb+git@google.com> <CAHk-=wit+BLbbLPYOdoODvUYcZX_Gv8o-H7_usyEoAVO1YSJdg@mail.gmail.com>
 <CAMj1kXFu=fABi+d=A5PL2yNx2b70toT9KtDfnvU=8mmUBHMutg@mail.gmail.com>
In-Reply-To: <CAMj1kXFu=fABi+d=A5PL2yNx2b70toT9KtDfnvU=8mmUBHMutg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 14 Oct 2024 11:10:35 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjk3ynjomNvFN8jf9A1k=qSc=JFF591W00uXj-qqNUxPQ@mail.gmail.com>
Message-ID: <CAHk-=wjk3ynjomNvFN8jf9A1k=qSc=JFF591W00uXj-qqNUxPQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Use dot prefixes for section names
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Oct 2024 at 10:44, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> We have this code in arch/x86/Makefile.postlink:
>
> quiet_cmd_strip_relocs = RSTRIP  $@
>       cmd_strip_relocs = \
>         $(OBJCOPY) --remove-section='.rel.*' --remove-section='.rel__*' \
>                    --remove-section='.rela.*' --remove-section='.rela__*' $@
>
> Of course, that could easily be fixed, I was just being cautious in
> case there is other, out-of-tree tooling for live patch or kexec etc
> that has similar assumptions wrt section names.

I'd actually much rather just make strip_relocs not have that "." and
"__" pattern at all, and just say "we strip all sections that start
with '.rel'".

And then we make the rule that we do *not* create sections named ".rel*".

That seems like a much simpler rule, and would seem to simplify
strip_relocs too, which would just become

        $(OBJCOPY) --remove-section='.rel*' $@

(We seem to have three different copies of that complex pattern with
.rel vs .rela and "." vs "__" - it's in s390, riscv, and x86. So we'd
do that simplification in three places)

IOW, I'd much rather make our section rules simpler rather than more complex.

Of course, if there is some active and acute problem report with this
thing, we might not have that option, but in the absence of any
*known* issue with just simplifying things, I'd rather do that.

I feel that our linker scripts - and linking rules in general - are
already quite complicated, which is why I'd really like to take this
as a time to try to simplify the rules.

              Linus

              Linus

