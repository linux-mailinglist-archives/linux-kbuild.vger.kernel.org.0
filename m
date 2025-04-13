Return-Path: <linux-kbuild+bounces-6593-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFA7A87402
	for <lists+linux-kbuild@lfdr.de>; Sun, 13 Apr 2025 23:18:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E58B16E780
	for <lists+linux-kbuild@lfdr.de>; Sun, 13 Apr 2025 21:18:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1019E1DF963;
	Sun, 13 Apr 2025 21:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cDOxkV1Z"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368B1BE4A;
	Sun, 13 Apr 2025 21:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744579111; cv=none; b=u3f1dHlNNShP0W3FMaK7N5RD+ope0c2dyVJwvq97V7CxXRs+TcONeFwRXrG5XfZJFGF6USIJWjERQ+OuoRDOlDnBm7wzWPsAYklOdb0fkncpIb19QzqKqE9fHB8svmIcZio8rIFz9xl8Ln7uSleCIMoHI3VALWjCp+LTafjBX34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744579111; c=relaxed/simple;
	bh=raQGkqFfWPQ4kSfWKJwuKeKf0iWVueQrNN5LvU93UqM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YGps/Qmy9570kxRHJer8Q9ayZ+epoRxOs0veQCxQvfewFnQ6qgpCEynMc0aJ8szx9vhyWlPusnHP/wCNH2Ff/Eaaxw/CjNxD0crir0Lzv7DvaNcNdQi5JyCTl8P9OeFoZ9ubTG18MPL15Qgxvdv8/Roayxq3ifOay8WmrV77xW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cDOxkV1Z; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30c44a87b9cso30525141fa.3;
        Sun, 13 Apr 2025 14:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744579107; x=1745183907; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MgZ+4FRd5P6W+WacLuyzZV0367MZvU93+wQZazxw0/Q=;
        b=cDOxkV1ZjTHqrMHZh7cRa5Oghjpd8OnYNDJVKEoOSxv3AgXlXw+hB4lAWFvnYEMlcy
         Bz0h/yjs6Wz9bnUPZMSwMe+zfvtmJraF1ElIumoQ51/Pk3FXNT8YxgLUmTDfww0YY+XI
         +43MUR6GKPrPmaajYRwwn0yPL9RqN6jSTkp8Zpc35/BqcdJJtk5UDBdqU/Xh6wmwnvEx
         zC0dOpsTHNHM8EvilTbkrEtWmIbXYNNS/HDHYbqhILpteC8d4KOX+h08E5PcP6GoVtZG
         mqcIFbLmWHtbOC1S8iF7qW0/8WYpQvVAW4cVHMDmzgfgCxe8EgObTHF9gDHjTm7fJRd9
         lF1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744579107; x=1745183907;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MgZ+4FRd5P6W+WacLuyzZV0367MZvU93+wQZazxw0/Q=;
        b=jRQ77OASKPHWxTqQuC/tEyhNbpgbprit5xhy66+AuPjY6so9OrfnJfKyJse0wNCBTU
         gNuzWU4kUtP8Y21KY4UsTPdkX+ld+kkaU3yXaR+zo+6GbvwfD6THg/tHP4cFmB3Ju6e6
         /HIqUSCJdTQtwJ8eN52ezg5Wg/VgT/GsM3juK2lLtqJ0W7RWAesAZOZ30qyK8NnrMB+j
         0fAKZlPy9tXw0Zh94yw3nJOzgcy0mfklzjRjCATEV1lmidEJ1ZfPqTPxrwaD5IiwODus
         jr85n5OtebOZ1D6DNZpJXvzbjuRtwWNKDMWA0q4Day2ANLleHOVNZOE1PPT9uiULoFMv
         QkyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSY8tcZjbwzgaVvxup9c3FGqF/lzHQ9E/4mQ3xysecXQkDDwJKRBXjzE0RhJaqg4xaQJccvwmEa6xk8h5i@vger.kernel.org, AJvYcCUjJ50tDrGgvo/p3K0wPvTbmRuQN9pHRN1lhom+dmu+Icw5eke1iEG+M+qkE5cnWn4PcaTDDQ+J/6h4P9s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCbRJWXF0Cadx9+/uJocip7KKF2aeXnOtkjvktcK47fSh3I2qG
	fd2WxRUkKGj9vs06PI/EItAMEvdb0WNs98ABoyhJrpUoy2Oyzen3/OLLJyX+VR/dgMzT9jo4uv/
	T5T2c3k7Axd8zzKtU6YxVcK3VtFZEVHkE
X-Gm-Gg: ASbGncsvbznpX6SJ1R3DRiwUOV8eq/Tr8nYw/HTJmRRGp7E4M88JkekUj3b32cx3eNc
	wKHYWQ+2kvpwNP5lnO7GR3sg9iwP5d97SC/QNmIwBHbmBw9ybckSj6k7UHrM8B6lrZfJHrZJC3T
	L9YmcKeFht418NSnWsC1ixlw==
X-Google-Smtp-Source: AGHT+IF10YZnchUlIP26SKwB8CehSle22uFVFJaHwkd6TUJ2UcE2Juerg7vSKhcdnW3cHzTRlfD7h9LDkVwkopV8S1U=
X-Received: by 2002:a2e:bc26:0:b0:30b:b8e6:86d7 with SMTP id
 38308e7fff4ca-310499faea9mr33585201fa.22.1744579106899; Sun, 13 Apr 2025
 14:18:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250404102535.705090-1-ubizjak@gmail.com> <CAK7LNATO1RfACvWhHJuLi-FYWMnSn6+Tp67-EZtVWNk+RCSTVQ@mail.gmail.com>
 <CAFULd4bx9BGKo_4kn14rsVr44otpdjpjn_o6=zMp8iu98f9Upg@mail.gmail.com>
 <CAK7LNATnactfA2U0CB2VcoE1eDc+bj=Jjye-Khsc3xG-iZ2XVQ@mail.gmail.com>
 <CAFULd4b25r5wf31DJputSOZhhMTrejQ_3-2P5rpeOL8H=4_mcA@mail.gmail.com>
 <CAK7LNAQVbwnnX5TJLmEShtmUtLCwr=rnZgwX9NoAke+PqzsqiA@mail.gmail.com> <CAFULd4b2azU-oBOTTXgQ6ahkVeYWHTJrnmJ97vtLm3P6jMOeug@mail.gmail.com>
In-Reply-To: <CAFULd4b2azU-oBOTTXgQ6ahkVeYWHTJrnmJ97vtLm3P6jMOeug@mail.gmail.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Sun, 13 Apr 2025 23:18:14 +0200
X-Gm-Features: ATxdqUFANOECibD458_-q2ib3f5_UXQAlv1-slcKpRR0AWa0U1mdz51SUEM0d30
Message-ID: <CAFULd4aLMF_2AbUAvpYw+o1qo6U-Ya_+Ewy-wW17g-r-MBF9_g@mail.gmail.com>
Subject: Re: [PATCH] compiler.h: Avoid the usage of __typeof_unqual__() when
 __GENKSYMS__ is defined
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Paul Menzel <pmenzel@molgen.mpg.de>, 
	Sami Tolvanen <samitolvanen@google.com>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: multipart/mixed; boundary="000000000000f32d450632af7932"

--000000000000f32d450632af7932
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 6, 2025 at 5:36=E2=80=AFPM Uros Bizjak <ubizjak@gmail.com> wrot=
e:

> > You are still seeing the warnings because __typeof_unqual__
> > is not only the issue.
> >
> > Hint:
> >
> > $ make -s KCFLAGS=3D-D__GENKSYMS__  arch/x86/kernel/setup_percpu.i
> > $ grep  'this_cpu_off;'  arch/x86/kernel/setup_percpu.i
>
> I see.
>
> With my workaround, this_cpu_off is declared as:
>
> extern __attribute__((section(".data..percpu" "..hot.."
> "this_cpu_off"))) __typeof__(unsigned long) this_cpu_off;
>
> while without workaround, the same variable is declared as:
>
> extern __seg_gs __attribute__((section(".data..percpu" "..hot.."
> "this_cpu_off"))) __typeof__(unsigned long) this_cpu_off;
>
> It looks that genksyms should be extended to handle (or ignore)
> __seg_gs/__seg_fs named address prefix. Somewhat surprising, because
> genksyms can process:
>
> extern __attribute__((section(".data..percpu" "..hot.."
> "const_current_task"))) __typeof__(struct task_struct * const
> __seg_gs) const_current_task
>
> without problems.
>
> I'm sorry, but I'm not able to extend genksyms with a new keyword by myse=
lf...

The following patch that handles typeof_unqual() as typeof(), and in
addition ignores __seg_gs similar to how other type qualifiers are
ignored, avoids genksyms errors.

Uros.

--000000000000f32d450632af7932
Content-Type: text/plain; charset="US-ASCII"; name="p.diff.txt"
Content-Disposition: attachment; filename="p.diff.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_m9g5btlj0>
X-Attachment-Id: f_m9g5btlj0

ZGlmZiAtLWdpdCBhL3NjcmlwdHMvZ2Vua3N5bXMva2V5d29yZHMuYyBiL3NjcmlwdHMvZ2Vua3N5
bXMva2V5d29yZHMuYwppbmRleCBiODVlMDk3OWEwMGMuLmVlMTQ5OWQyNzA2MSAxMDA2NDQKLS0t
IGEvc2NyaXB0cy9nZW5rc3ltcy9rZXl3b3Jkcy5jCisrKyBiL3NjcmlwdHMvZ2Vua3N5bXMva2V5
d29yZHMuYwpAQCAtMTcsNiArMTcsOCBAQCBzdGF0aWMgc3RydWN0IHJlc3dvcmQgewogCXsgIl9f
c2lnbmVkX18iLCBTSUdORURfS0VZVyB9LAogCXsgIl9fdHlwZW9mIiwgVFlQRU9GX0tFWVcgfSwK
IAl7ICJfX3R5cGVvZl9fIiwgVFlQRU9GX0tFWVcgfSwKKwl7ICJfX3R5cGVvZl91bnF1YWwiLCBU
WVBFT0ZfS0VZVyB9LAorCXsgIl9fdHlwZW9mX3VucXVhbF9fIiwgVFlQRU9GX0tFWVcgfSwKIAl7
ICJfX3ZvbGF0aWxlIiwgVk9MQVRJTEVfS0VZVyB9LAogCXsgIl9fdm9sYXRpbGVfXyIsIFZPTEFU
SUxFX0tFWVcgfSwKIAl7ICJfX2J1aWx0aW5fdmFfbGlzdCIsIFZBX0xJU1RfS0VZVyB9LApAQCAt
NDAsNiArNDIsMTAgQEAgc3RhdGljIHN0cnVjdCByZXN3b3JkIHsKIAkvLyBLQU8uIH0sCiAJLy8g
eyAiYXR0cmlidXRlIiwgQVRUUklCVVRFX0tFWVcgfSwKIAorCS8vIFg4NiBuYW1lZCBhZGRyZXNz
IHNwYWNlIHF1YWxpZmllcnMKKwl7ICJfX3NlZ19ncyIsIFg4Nl9TRUdfS0VZVyB9LAorCXsgIl9f
c2VnX2ZzIiwgWDg2X1NFR19LRVlXIH0sCisKIAl7ICJhdXRvIiwgQVVUT19LRVlXIH0sCiAJeyAi
Y2hhciIsIENIQVJfS0VZVyB9LAogCXsgImNvbnN0IiwgQ09OU1RfS0VZVyB9LApAQCAtNTcsNiAr
NjMsNyBAQCBzdGF0aWMgc3RydWN0IHJlc3dvcmQgewogCXsgInN0cnVjdCIsIFNUUlVDVF9LRVlX
IH0sCiAJeyAidHlwZWRlZiIsIFRZUEVERUZfS0VZVyB9LAogCXsgInR5cGVvZiIsIFRZUEVPRl9L
RVlXIH0sCisJeyAidHlwZW9mX3VucXVhbCIsIFRZUEVPRl9LRVlXIH0sCiAJeyAidW5pb24iLCBV
TklPTl9LRVlXIH0sCiAJeyAidW5zaWduZWQiLCBVTlNJR05FRF9LRVlXIH0sCiAJeyAidm9pZCIs
IFZPSURfS0VZVyB9LApkaWZmIC0tZ2l0IGEvc2NyaXB0cy9nZW5rc3ltcy9wYXJzZS55IGIvc2Ny
aXB0cy9nZW5rc3ltcy9wYXJzZS55CmluZGV4IGVlNjAwYTgwNGZhMS4uZWZkY2YwN2M0ZWI2IDEw
MDY0NAotLS0gYS9zY3JpcHRzL2dlbmtzeW1zL3BhcnNlLnkKKysrIGIvc2NyaXB0cy9nZW5rc3lt
cy9wYXJzZS55CkBAIC05MSw2ICs5MSw4IEBAIHN0YXRpYyB2b2lkIHJlY29yZF9jb21wb3VuZChz
dHJ1Y3Qgc3RyaW5nX2xpc3QgKiprZXl3LAogJXRva2VuIFRZUEVPRl9LRVlXCiAldG9rZW4gVkFf
TElTVF9LRVlXCiAKKyV0b2tlbiBYODZfU0VHX0tFWVcKKwogJXRva2VuIEVYUE9SVF9TWU1CT0xf
S0VZVwogCiAldG9rZW4gQVNNX1BIUkFTRQpAQCAtMjkyLDcgKzI5NCw4IEBAIHR5cGVfcXVhbGlm
aWVyX3NlcToKIAk7CiAKIHR5cGVfcXVhbGlmaWVyOgotCUNPTlNUX0tFWVcgfCBWT0xBVElMRV9L
RVlXCisJWDg2X1NFR19LRVlXCisJfCBDT05TVF9LRVlXIHwgVk9MQVRJTEVfS0VZVwogCXwgUkVT
VFJJQ1RfS0VZVwogCQl7IC8qIHJlc3RyaWN0IGhhcyBubyBlZmZlY3QgaW4gcHJvdG90eXBlcyBz
byBpZ25vcmUgaXQgKi8KIAkJICByZW1vdmVfbm9kZSgkMSk7Cg==
--000000000000f32d450632af7932--

