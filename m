Return-Path: <linux-kbuild+bounces-5885-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A214A42D42
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Feb 2025 21:00:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89491188E4B6
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Feb 2025 20:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93AED241698;
	Mon, 24 Feb 2025 20:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ABJfisMb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A94A20766B
	for <linux-kbuild@vger.kernel.org>; Mon, 24 Feb 2025 20:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740427203; cv=none; b=OMKrqxqARYq+OzkhWT1EX64KY2hEnnyxmDDSnXrJJgVir5ESesHW+0FUsdr6iGl7NM8tT44A5bdY2wUtzTwqcSt9a7iDLsuCuk3kNocavOBJwwvzMXLXk+kHeyXLZoQODABjhT3yVnHvoWUxfVPSCQEK0vwM36HcZwaGyyuUgYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740427203; c=relaxed/simple;
	bh=nLwuOdjdJXvX/L9DiA+yud6gW2mm3fqYEuQw5/PQS/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LS+kGUYfnhtlBOtsn5wUkro6XQfnJcu0lA9sfcYZY+Zidu6/w8okKoHTQ6Cb4B0csmPZo85w2b8WpdQqh3tdASsewFSlytQIEd7EFuZPWX/aUxqxh7AY5zNePPEIC9wEAwJTfQyQqoxSa2vKyMTOcnilB+hKnClWE6T6e3ZGKPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ABJfisMb; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-abb86beea8cso865551966b.1
        for <linux-kbuild@vger.kernel.org>; Mon, 24 Feb 2025 12:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740427199; x=1741031999; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=14rd0ok4JN44cEuZAmi9ww/Q9ND69yR+FOc9H5NPv5A=;
        b=ABJfisMb9JhDTVWMpr/UO/7ii1puDFErlKpEc5Lw1JOt6lMNvIDzWZvSDkiMerHHLU
         JphjU2dDWBufSEdMnbnDQ9FMddhWmz+cZNbG2i26xBcvYZMOG2BOmdg65mglIXIf9Ng3
         4qA8r/AJ3Q9qotxgUkn/mxzD/Sa3QdpffV25g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740427199; x=1741031999;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=14rd0ok4JN44cEuZAmi9ww/Q9ND69yR+FOc9H5NPv5A=;
        b=j/x1cjqdo58ZokKGP9KmuJx1Eectf5tIUGkekwIZWrfa/KQxizjZLjnE3yp4EZ6bop
         ZHmlpzlk6XhabAX+AdsJYaplz2VB4kC5dJ12jgBt0ZFPwCRvPYPLU51WpYjUsotoixuJ
         hfUUeOzhI+XZ7Zk9t+YjbNGLGjOqqx6UUO0oJYg35MSBnifv/2OMME5keOqryKm6lV3n
         Kt3BKp+OVUbewQ+0ectGROoggMEqpIIpOPAoQ8XcbEcd4VgGwLCUHO3mfSzxIZHAz5PW
         Jd6Y5VG1h6jjE1J6ombXE7nshg6QNmys7U5voDoqOtjCWYuPAQ3j+I7CmjbzAqhlz+Wy
         P6+g==
X-Forwarded-Encrypted: i=1; AJvYcCU8UaRdYYmtjjKdOQhJE+zZYpQv0CSOTDWpRuUs09hDPztauOCUMHa+WqM6+9qaUc/WwEe6Vo9sztND1Qw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy75/4P2HQbQF1TENvZTC1zFXq1rJsiPeLvjG5KM6uIjzX7dkKO
	WVm/ORXjUwdnU1RjfE43vsPh/t52G7U1q3ABLTQ83fsLBaqfoQenryJjzRBlNZ4PwaKEkgBdYYb
	UH+Y=
X-Gm-Gg: ASbGncuyjWH9x+Z0NCtJBjsY3o1BrR59c8GcdMHIYjXidaLzzku8E9j7r9vPP/RRY5u
	eXQsPyKTSA6rKQtKjOJAjmKCb3ok701Qe60dbigJ5hy1NK7qLnxi33aVEqbwIdiSD71Q+1187VY
	amsrc3YDlQ0cZeJ4947ozveJD0sIIpjpryFIkO6eXkahCVANCCu/AxYNzCUN55saEeC160JUcki
	ZcIs45EkJQOr55rHi2HdmGHfcN4RaMDTKHev6yNkces1tl+KBUOfX4/C62LSVQ8+RN3GFUmg6Y4
	mh+LonSb3sMO/s76/jvZ9F6Fd6ZG8P+K1xlmHySgxee7ZOH3K9gur8f36UKlxqmmtQwwuK2oDCw
	P
X-Google-Smtp-Source: AGHT+IGu36MutfEf8x85DaL2bH+SwXM0JvlQHRwHi5xh1JLxvILzLuoKrjnQsWmDoQ9M+ObGBOacFg==
X-Received: by 2002:a17:906:30d4:b0:ab7:eff8:f92e with SMTP id a640c23a62f3a-abc09aa9d7amr1153939166b.21.1740427199150;
        Mon, 24 Feb 2025 11:59:59 -0800 (PST)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed205398dsm13249566b.141.2025.02.24.11.59.58
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 11:59:58 -0800 (PST)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so146970766b.3
        for <linux-kbuild@vger.kernel.org>; Mon, 24 Feb 2025 11:59:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW0D+CVI1O7ISbtZpcTauluZWoZQ2SPmrI5nJw5GH6mvAuCwcxGCNdiecQxLJKRVUZCf+NyOIkrAeQicHM=@vger.kernel.org
X-Received: by 2002:a17:906:c196:b0:abc:a1b:2781 with SMTP id
 a640c23a62f3a-abc0a1b2801mr1400279566b.4.1740427197882; Mon, 24 Feb 2025
 11:59:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250224132132.1765115-6-ardb+git@google.com> <Z7y_i-ySL68BfkgQ@gmail.com>
In-Reply-To: <Z7y_i-ySL68BfkgQ@gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 24 Feb 2025 11:59:40 -0800
X-Gmail-Original-Message-ID: <CAHk-=wg0=Vh=9z_rUGSJn6p6xH8Z9Wkz0TLPenSt1m-1rHmJyA@mail.gmail.com>
X-Gm-Features: AWEUYZmJozyfchMZDhF3x7FUhBpFUzVG2GDnxWkFH_5a1ybndYOn9eQZJpYeuao
Message-ID: <CAHk-=wg0=Vh=9z_rUGSJn6p6xH8Z9Wkz0TLPenSt1m-1rHmJyA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] x86/build: Get rid of vmlinux postlink step
To: Ingo Molnar <mingo@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	linux-kbuild@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Feb 2025 at 10:51, Ingo Molnar <mingo@kernel.org> wrote:
>
> But in terms of justification for upstreaming, the reduction in
> complexity alone makes it worth it IMO:
>
>   19 files changed, 52 insertions(+), 87 deletions(-)

Yeah, absolutely. Our fancy make build rules still have too many of
the phony forced targets, but this is a few less of them and makes the
build confirm (more) to the usual rules.

I do wonder if we could just get rid of that
CONFIG_ARCH_VMLINUX_NEEDS_RELOCS entirely and make it just be how all
architectures do it.

Yes, it was apparently "just" riscv/s390/x86/mips that did that
'strip_relocs' hack, but at the same time that whole pass *feels*
entirely generic.

IOW, this all makes me just wonder why other architectures don't do it?

              Linus

