Return-Path: <linux-kbuild+bounces-9003-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D43EBBBD647
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Oct 2025 10:53:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E61C3B4D92
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Oct 2025 08:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BF3E20311;
	Mon,  6 Oct 2025 08:53:18 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492F525BF15
	for <linux-kbuild@vger.kernel.org>; Mon,  6 Oct 2025 08:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759740797; cv=none; b=PmRqPmC0gY0Lr9A6ukCkxMM35ej7114AR5nxGqGFIBEK9Nt2Hn4LgvEC1I5Iw9JLX5lgflnjmNeyhk96Yep2JvSy6VJ21uRu532kH5/baL20JBgIqHU4tgI6nMzCNDKrUjhBiRzyS1ai21exwEoTc0P86wF8vqtw7tzsx0rOqLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759740797; c=relaxed/simple;
	bh=vvGQ3AOEp78e5lN14Go+QxLRLFjUb+VFpeq/hZQsw8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M7QHllJLYi3URzEEqM97HipuJ2wAOCVcBPD8YHtEjLHqgxfoq/eTVh368jm3yDbpqGILw0sRLRLwBo6HGoIf65j6A9GpxT+gU+1ISX+h1LmujetvzjcpXmLmQaRLfdcwFiosRRLgcyICelEEES3FdMftUaTdw2OgmGUkxfkDBf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-54aa789f9b5so3531187e0c.1
        for <linux-kbuild@vger.kernel.org>; Mon, 06 Oct 2025 01:53:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759740795; x=1760345595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T9r4pmCW2atY0hYHJFbkWjzhWu2NPZE5D10ci+sfHj4=;
        b=MLGx0zgNRr8RD6+k2C4MSXe2jXnYbEgA52i2kad6CyDXvSEQRAiALtEITqgJjNX6QD
         5rzPaNHCDa5qnxWA0p89ecq2DcmHsjNcEhv6+4KnPLoEC1nLGWMc/Szve5hJwPgcps2k
         79cguaCUiNKM3pZTUYDDaAfAhZ5b/A+HwaQ3nr+HQzF2HFHKmSNQjBSywkp90VSiAri8
         hHFcOaPKO3TXWCJE7dVeEYIq/SXSPEbviK7mwrTRAM2ga3eJAvyrzz2G55A+MR5mAcZG
         q+mydVWvf7cOJD6pYScXKAftYMZBzsFL3jC2xMnAHFM+4/MS3Nrw2EBJYuUHJBRU5R4u
         Vq5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWtmUrRdEIznKq3gmlVhMscknDJH69EV8vN5WA3kcBFW4NVrM6Away/4OAW9Mova9/i8aReqiWC3pxjTLA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzW7KJYwGTOZCPo2EDl21reqSK2KLqg4i/+MDIP4BjWBsoxFEML
	SVDQcyOaWilRRmD5tdi8zEQSIx7nnsZCpSA20sJFf7LPmm0DWn9MbduJAS2gYtgW
X-Gm-Gg: ASbGnctH/1DoOPqAKNdOHc9zl0FsI7p4eqKkzJ4Ig369d2TJ5PL87fqDm/Sf58Knaxx
	HfKF3OAPEkz+3N8Qcln1tEclDNmsYe46m8irD//MlWYzUOC8YoWj+gVPkOiqekKjn46mMj/tv2M
	rNNk8NsckZzBKViSrJeafNyzRnh46bMLwYDX3A1jLqreGPQmStwEkg56iw+eo37srROhBsuhmzo
	nlmgndRQbVzBtIsLKU/Iorp0uAGuJoZhNFREFJoU+vcDmBqVYPN8P4ILy2I3fbURAQfETHZTczm
	IijtnG90gN9XXvJ+hgZSIwDPFtETZ1/dXJZHaw6rJcL1xdJpjne7oYnf7WufqlGceX3Dx93pMK2
	gyhaySbZyLJeIv2WqRaEWsFcAZyCCDihhCz5guuI4fAm7RCIkAcpfHxhKldJYdB/oqwQfVfzje+
	ZiDqUi4uqH4OJb2UtMekQ=
X-Google-Smtp-Source: AGHT+IGgv3uEUEqHb7ukH560KD/CsrpkXEQDE71PrepKDuL2mia4q1T1DY9ekRpbM08hIC+nlreGfg==
X-Received: by 2002:a05:6122:514:b0:54a:8690:719b with SMTP id 71dfb90a1353d-5524ea251b9mr4050131e0c.11.1759740794630;
        Mon, 06 Oct 2025 01:53:14 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5523cf63c6asm2844871e0c.19.2025.10.06.01.53.14
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 01:53:14 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-580144a31b0so2407481137.0
        for <linux-kbuild@vger.kernel.org>; Mon, 06 Oct 2025 01:53:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXFMSuhvnNd2JqzPXDsRe12ukSegHLEiHqZXaDOjrdVmqTC4Z7wmXzjB3vYm07VDreTOYDdFMi270NBqg4=@vger.kernel.org
X-Received: by 2002:a05:6102:1620:b0:520:c4ea:4bcd with SMTP id
 ada2fe7eead31-5d41d055f58mr4085607137.9.1759740793940; Mon, 06 Oct 2025
 01:53:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250813-kbuild-hdrtest-fixes-v2-0-8a7921ca3a03@linutronix.de> <20250813-kbuild-hdrtest-fixes-v2-4-8a7921ca3a03@linutronix.de>
In-Reply-To: <20250813-kbuild-hdrtest-fixes-v2-4-8a7921ca3a03@linutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Oct 2025 10:53:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUypDox5PRJPS1HBvQP=8+C79fx1-zS4w89aYGoM3PY5w@mail.gmail.com>
X-Gm-Features: AS18NWAmMoW487-uzM8xW8F4Sp_8IsJYBO5PJqrfV0D4Y_cOQNM9JCgQ1kpkdEA
Message-ID: <CAMuHMdUypDox5PRJPS1HBvQP=8+C79fx1-zS4w89aYGoM3PY5w@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] kbuild: uapi: upgrade check_sizetypes() warning to error
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Fri, 15 Aug 2025 at 03:26, Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
> No problematic type usages exist anymore.
>
> Make sure it stays this way.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
> Reviewed-by: Nicolas Schier <nsc@kernel.org>

Thanks for your patch, which is now commit c3a9d74ee413bdb3 ("kbuild:
uapi: upgrade check_sizetypes() warning to error") upstream,

> --- a/usr/include/headers_check.pl
> +++ b/usr/include/headers_check.pl
> @@ -159,7 +159,6 @@ sub check_sizetypes
>                               "found __[us]{8,16,32,64} type " .
>                               "without #include <linux/types.h>\n";
>                 $linux_types =3D 2;
> -               # Warn until headers are all fixed
> -               #$ret =3D 1;
> +               $ret =3D 1;
>         }
>  }

Unfortunately not all of them have been fixed.
On m68k all{yes,mod}config:

    usr/include/asm/bootinfo-amiga.h:18: found __[us]{8,16,32,64} type
without #include <linux/types.h>
    make[6]: *** [usr/include/Makefile:89:
usr/include/asm/bootinfo-amiga.hdrtest] Error 1

As this is a false positive, I have sent a fix for headers_check.
"[PATCH] kbuild: uapi: Strip comments before size type check"
https://lore.kernel.org/6e68ab921a728caea4f3f37bfae9b1896edfa97a.1759740354=
.git.geert@linux-m68k.org

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

