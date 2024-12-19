Return-Path: <linux-kbuild+bounces-5215-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A08549F8852
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Dec 2024 00:02:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5E4E87A1A0E
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2024 23:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B45741B85D3;
	Thu, 19 Dec 2024 23:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Fr92NC7W"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523911A0BE1
	for <linux-kbuild@vger.kernel.org>; Thu, 19 Dec 2024 23:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734649325; cv=none; b=u0Z6J/0x/ww5WxyD6ijmjX1NOXzBhMFzXfXzOD0ujQVruI9Wz/e/KMyZ9BMCaAcZdNdnMFZ9zjG+o4v1xJMjiuGLs6AtvGtpdgKri4Ac/qmfewL8YjHHurb24lchjrcogeRwQm0SzSPDMQ7uO+9MyJa3koowdFmhzPCIo6rsHw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734649325; c=relaxed/simple;
	bh=9t9sJm17zMjh9nS2520pB9UHMLqjCKiUePdrW91YeJE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TTILSAwOr7Ngg13LkOZoHtfPYUda5T+EpOXp4PqFDWdz9Dh02/MERPn39qH9ApPCDlpuh7/ZzxahYZ7xOKw/b+pKEk1YclLqrRr9xoQ5pb1lh5lB1S/TkcQiGn+3jSyBvhaBbzrXt/Css3FlaNU/SaoNEl/9AOke7Id/HODC6EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Fr92NC7W; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2ef714374c0so1072776a91.0
        for <linux-kbuild@vger.kernel.org>; Thu, 19 Dec 2024 15:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734649323; x=1735254123; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9t9sJm17zMjh9nS2520pB9UHMLqjCKiUePdrW91YeJE=;
        b=Fr92NC7WY7nOX9EdeIELUNGK07/7sxbusTDuP4rvECpz7276M1BAQvaw2mOxLsDlMI
         h7eS0cmgHINWdz6I8ZF5fDD2j8BeQ2aPHTw+pm8mezeH41Dy9qvwR8j4F6G2Uzmxu4LX
         RzamDoHMpA7YclihHwN5kXQtjHA41odPgcwbKrWaYXO3ohZRzHI1l7kFdTLva7XK5FA3
         KG3diaDoggG8zWlov5qVMAMrAecOxd4HE6gTwim9ROiQJ8O67dT6grAjSQ2ZvS4nZwAW
         hmgls6+bPyluq+dN2RmOfzg1rtSf1/RxdQYTtOkVIOjVmoEjDJzYNgioXuasRySa3R4c
         OR1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734649323; x=1735254123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9t9sJm17zMjh9nS2520pB9UHMLqjCKiUePdrW91YeJE=;
        b=bCRZmH7eAgpwj/PBu9GiVCBV1bAeaEE8GHBUkLIYh68p3ZyDZj3KBR7Bumgm2+EcrH
         md5hGXLIhRl0i+AuJUvi/TRIxVaCCz3zTxxK40P9eobkPVksSlDJrfBxF6VDlQM1fz2Y
         G3NZNzF/7fJqhWxgwpnjbEgK1h17TakA16kTq/QqTz3fJFCGQHnlbVg4O6DX59YIe0+4
         1ZjDZSrTaOXeLoe6dZnkYNZaJmj5FmnpScXMNnxJZ2aHerTPLNNMy+V1iTRD74NtOyar
         RlUSJFL38Olw/sCYrvEdpao45kKoy0tlye8dj5ZoLS1TdYjKAZEEDHV9Qs5IoML4s7tI
         4r2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVsg8hZADBxitTa9lSIhAjZomRAmsvJ4El2GhSpUPS3hdRmz814gkTeDX6soRGuIY8FWajmkE8OgN7nglw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyS6xU729pFSLXhHrKmnxxFyg0PaXv7SJjNwwDigcTpT6/VOdnA
	3RCCxwETiTV4d31w2+WUP+ft6CmkJefoqDEOcZKYr/OuyZt71ihS+urWrM4p/9jTV7mhTQuPj0R
	OpVWQG5sH3gSvxAfUs5iXHMafMih/ZTXpr2Eh
X-Gm-Gg: ASbGncuXx8coVZZLQfncvmhVxWXtWEyiqLEieQYzMS7uSvouxpX3Nmtau6cNyYPbxih
	B6KZ1Akw31IhSZTrV/nJKBgFRTeLifcmRSnMQ3Ss3AEvaLXRvTvVsiBvphVeQrOSmjs4=
X-Google-Smtp-Source: AGHT+IFzReAaCkEqUEW+1n4s+PAdFdKrrl4F01bTRyQK3ZxyuMEm8z1A4VPjOUJ8qEl5uYrWhtnCS0kYDmRkL7Y4DGo=
X-Received: by 2002:a17:90b:5190:b0:2ee:5106:f565 with SMTP id
 98e67ed59e1d1-2f4438e493emr7160538a91.16.1734649323309; Thu, 19 Dec 2024
 15:02:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241218-objtool-strict-v2-0-a5297c961434@google.com>
 <20241218160656.18cbdcbb93b0e0bcf28adf18@linux-foundation.org>
 <20241219010054.pxcnejgkvy3g744k@jpoimboe> <20241219221913.GA1259354@ax162>
In-Reply-To: <20241219221913.GA1259354@ax162>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 19 Dec 2024 15:01:51 -0800
X-Gm-Features: AbW1kvYCVmlUEvz1HQsCdFztetspccUmhnURpw0E9O2r9_4s0rIDBZyrpgtQ9MA
Message-ID: <CAKwvOdm+03xrgupEGny4VG3mKVroYPH55qgGZcFbudFod9O=kA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] objtool: Add option to fail build on vmlinux warnings
To: Nathan Chancellor <nathan@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Brendan Jackman <jackmanb@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2024 at 2:19=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Some objtool reports get sent to only llvm@lists.linux.dev when clang is
> involved (due to a historical filter IIRC, I cannot find the original
> request),

https://lore.kernel.org/all/CAKwvOdmJvWpmbP3GyzaZxyiuwooFXA8D7ui05QE7+f8Oaz=
+rXg@mail.gmail.com/
perhaps?
--=20
Thanks,
~Nick Desaulniers

