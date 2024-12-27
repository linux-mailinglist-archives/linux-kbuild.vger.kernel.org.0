Return-Path: <linux-kbuild+bounces-5252-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE7B9FCFB1
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Dec 2024 03:58:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1153C3A048A
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Dec 2024 02:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3DFB4A1D;
	Fri, 27 Dec 2024 02:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="SvmfUSVp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C577135950
	for <linux-kbuild@vger.kernel.org>; Fri, 27 Dec 2024 02:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735268327; cv=none; b=rrDCpkglKSSpXksp2Sknlvwin+rzRK09HIZZQJdvOET859DZcA+60FWFvVqFgQ5HWhOoVBH/6BhDHwhA9JjDH8G3h8+6DIK9qajl+agpYyUyCrYakbsJsJAgVJIzCNfApmv0vy4LR36SjvjiYTx0004SOYZo4o3h/f6fWHfXNX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735268327; c=relaxed/simple;
	bh=FLl3QcbQ6gl5PtwWermYbCj21YqJX5D0JrVgwIktLPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ibdV0UED11DDc522LK9Rd70ktOlgW3UfosZe3s8hII2RkGM/ql7IK2eNrmMcE9pY/AHomhIdY1R/hHwzuhrEF2iZPG1zt0a6LCmchQs3NMpLWyQgymw4fEtriCj/Ax9U4tdA1VE7cOQalHyjEngzoraL0tqaoLgYIKRODMjIWTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=SvmfUSVp; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aa5f1909d6fso1021891166b.3
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Dec 2024 18:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1735268324; x=1735873124; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XvIAPNYP54LEnLyIp5Ezwqoks125tVudSg9dAYgT6rM=;
        b=SvmfUSVpXco1B8RWMLqlOpiTROXLnf7ZXF1Nu2LQnaRyMUlnc7wT2MhZDVT8w/rutu
         +ZaG0UH7Fc6YOMmivd0gCTix9qJmd355HMyRMIOXjNQxcLQ4Pb7xLnqbqWaXn08UydJq
         SlyHjmtIWT3NXGXKn+x0t04kTIW4XrOQKb//M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735268324; x=1735873124;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XvIAPNYP54LEnLyIp5Ezwqoks125tVudSg9dAYgT6rM=;
        b=FkDR5MnCLRuzcMhWsxYdNv0qtX4vMslXCes1zvRBu4K5Q+Cj3yRIFsbgfXgbdTFrIi
         hZEXkrGAI11AjcGNyCZEgNL/O6SW1jbg2eX5jZSWgo3z/G9lN0RlE8F1B7xYPHVrhcz6
         B03f8U1gvu4qsR+jkPpwnq5h5x0xo0hE4+d89/mPowM+QpN8EF9VFJWXrZWijo/G3ZwU
         /fflbVptFwa2ac3lKM6iEIjxrjGucB+Qle03S5eHRTYivlZdVJvhXdFVLJaUv2A1XDkA
         q4b8c1j9m/cSkz5gHtRYH16mdM3w+iFxofV2kUiO39PIT3EcthfKejt7xH7Ok4hnxS/w
         TO9Q==
X-Forwarded-Encrypted: i=1; AJvYcCX8swdyIp4t8Nwoacj6jx9V/vK0gKSUn4rrBTFa+PbVReed4A7svYfhNkFvK8eSbLfa+SaYkSFlSXCQSaQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc3z39Zn8Jg89W89g0LlBwdtL0/XeEToyCycPHyaCDVsiwf88b
	YLuJILTCBqS7/mPvXusxcKXPrDu2w+ooA+rPKQ+bzHzoPE02i/woYSrrKZoBxKAnPkALt4jw7em
	vWcORDw==
X-Gm-Gg: ASbGnctS8nWJx041XnDjr0BgMN68mdEBP0FL1/50tuUNyMFOAHoUrwpWtoTFY0sgN0z
	gRsI4ldDQ9nZlG71wmC/ICeE+87PmmziMkYMEGbed3syyDjaqGEaP3/byxDXI6LB1aZwfAW/PWQ
	9KX74bcwdbtzHhHYbM7QrJGUY+cV+7y1ONCBlDMeDpTIMzV5ULGkoyp2lZa/oj0AChcXUmtg57x
	sfzqNXgBp2U0WHxnU0GSdXVpz+alkZ/qvUg0zkwu7TZxeXLBW5uGcI5wsRdXF/bqff02IlXTnr5
	kiKNF43ZxIvkaiYwhsR8Z4Nn06UoPLY=
X-Google-Smtp-Source: AGHT+IFAtYKn69SVKgBl009vfin4FoE6emLLtSfj9l3ftHycy7UYb2IoWHbN3J3ek5g/a5PT9aILyg==
X-Received: by 2002:a17:906:f596:b0:aa6:894c:84b7 with SMTP id a640c23a62f3a-aac2703396bmr2195170966b.12.1735268323838;
        Thu, 26 Dec 2024 18:58:43 -0800 (PST)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe41a6sm1063995266b.102.2024.12.26.18.58.40
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Dec 2024 18:58:41 -0800 (PST)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aa5f1909d6fso1021888266b.3
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Dec 2024 18:58:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVGQyEz7heQQnngJW14QvbMSJHqQfBOpDicQkiRc6+kANxuS/vqzkOAdvMIg6bCRDQk/T3Aw1WzzvbxFNU=@vger.kernel.org
X-Received: by 2002:a17:907:3e8d:b0:aa5:1a1c:d0a2 with SMTP id
 a640c23a62f3a-aac2d0478bemr2183880666b.34.1735268320564; Thu, 26 Dec 2024
 18:58:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241226164957.5cab9f2d@gandalf.local.home> <CAHk-=wgTFSqiMvbGYqFLQaERoeXR5nK1Y=-L3SN7rB3UtzG0PQ@mail.gmail.com>
 <20241226211935.02d34076@batman.local.home>
In-Reply-To: <20241226211935.02d34076@batman.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 26 Dec 2024 18:58:24 -0800
X-Gmail-Original-Message-ID: <CAHk-=wii_nN1X4O9=nztJy3rexKp9w5Gsp=J5kZ43Hekja+Omg@mail.gmail.com>
Message-ID: <CAHk-=wii_nN1X4O9=nztJy3rexKp9w5Gsp=J5kZ43Hekja+Omg@mail.gmail.com>
Subject: Re: [POC][RFC][PATCH] build: Make weak functions visible in kallsyms
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	linux-kbuild@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Peter Zijlstra <peterz@infradead.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Zheng Yejian <zhengyejian1@huawei.com>, 
	Martin Kelly <martin.kelly@crowdstrike.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Josh Poimboeuf <jpoimboe@redhat.com>, 
	Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Dec 2024 at 18:19, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> So basically the real solution is to fix kallsyms to know about the end
> of functions. Peter Zijlstra mentioned that before, but it would take a
> bit more work and understanding of kallsyms to fix it properly.

Yeah. The kallsyms code *used* to be pretty simple - really just a
list of symbols and addresses.

But it took up a lot of memory, so back in the day (two decades ago by
now) it started growing some name compression code, and then some
serious speedups for lookup.

See

    https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git/commit/?id=e10392112d315c45f054c22c862e3a7ae27d17d4

for when it went from basically a very simple array of names to be a
lot less obvious with that table lookup name compression (but it had
_some_ name compression even before that).

That said, I think it's really mainly just the name compression that
is a bit obscure and looks odd, and it's only used for the builtin
kernel symbols (module symbols are still just a per-module array of
"const Elf_Sym *").

And you can actually largely ignore the odd name compression - because
the *rest* is fairly straightforward.

For example, the actual offset of the symbol is simply a plain array
still: kallsyms_offsets[]. It's slightly oddly encoded (see
kallsyms_sym_address() if you care), but that's because it's an array
of 32-bit values used to encode kernel symbol offsets that can
obviously be 64-bit.

Encoding the size of the symbols should be trivial: just add another
array: "kallsyms_sizes[]", and it wouldn't even need that odd
encoding.

So I actually think it *should* be fairly straightforward to do for
anybnody who knows the kallsyms code at all.

The main pain-point would be *if* we want to actually expose the sizes
in /proc/kallsyms. That would be a file format change. Which we can't
do, so we'd have to do it as some kind of strange ioctl setting (or
just add a new file under a new name).

But maybe we don't even need that. If all the uses are in-kernel, just
adding the kallsyms_sizes[] (and accessor helper functions) should be
fairly straightforward.

Of course, I say that without having done it. I might be overlooking something.

           Linus

