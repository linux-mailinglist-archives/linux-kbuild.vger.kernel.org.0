Return-Path: <linux-kbuild+bounces-3932-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 369FF992000
	for <lists+linux-kbuild@lfdr.de>; Sun,  6 Oct 2024 19:37:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB8D91F216B0
	for <lists+linux-kbuild@lfdr.de>; Sun,  6 Oct 2024 17:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34B8D189BA0;
	Sun,  6 Oct 2024 17:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LPVRYAuV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D3A13A3ED;
	Sun,  6 Oct 2024 17:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728236217; cv=none; b=ct9X/oAexOppEDpxRuRzpo1r+e6FyAk1Qo+uSyrL1f3th9KmJh7WUSajG11coE7JPQO5f5YpLiWZ5ZoviXQVB2mbQnwPRPP7V5LV/90buLZ7+ZvVkBEIozRfrBQpHPAtmX7LRbqKBwTcqaDSDXQ74H/r+Y6aGJ5ClNmuMXnpkWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728236217; c=relaxed/simple;
	bh=Q1TMwAKeOIm2wcbXlht5uOX41hF/WJsY7Vcesi+KWKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MZnhtNipzV5lYbslL3GuxFjehvDKCN66l/dMVV4DMQONj7Gx6Zdt0rlnjn9DL9D4TvAaMzqal7VBkPD/ZozBQNUJlBUSIexsR/WX15cwvDmdh5FcYijEEbbSCUg2CFxoWE3lb1lVo+16J5D4I1n6Cg0+Zk+DQM4KaJJoiz46INw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LPVRYAuV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC92AC4CECD;
	Sun,  6 Oct 2024 17:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728236216;
	bh=Q1TMwAKeOIm2wcbXlht5uOX41hF/WJsY7Vcesi+KWKA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LPVRYAuVY66osVWJT6a3gRoh3ZuF3VFdIAzL+JyKcxtNG38NoazFwZlutZivsF8eB
	 f+R41ge+fUavVQVVu9pD+n5yXiCHNSNGX3EeWqk+evOvqcIOFEW5rEV72M0gBsRxRe
	 XNSTzw3OyIqaZ8E/fQLbFDEpg8yAygNlQPTdX70Q/YTV/BulC0PzoisFyCDHYeh7Xq
	 b4b5Qxa6f/yFqGfV+UXpIq8H1u6mPwOaSeTBPsEqgC0LjbXdhZJwI+1dQBqW5giGAa
	 wm0MuHVNPTdZ2MsMz9iZ5i/+bc5FXWpyiQmv1bL2s//U5dzZQUsuiGOPRdY4yUMRJA
	 qbb5Q0pTZbUhw==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fada911953so44876891fa.0;
        Sun, 06 Oct 2024 10:36:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWDDh0VNUT1gpZPd3QgOnLRl1QHxZclkOPEj1zfenW0PGdSxw/Kt4PqKsdWc/zS3ujWTZLUJTHMx/tyu04=@vger.kernel.org, AJvYcCWysX2hcmItTjqrlp0KPQqfn5V1PtE3Fl0Xo2JNuX5QdDiYfW5VhW7d4zzdrYgb/iocAV2QwpSAij209SNpsQ==@vger.kernel.org, AJvYcCXB7c9E9t4kpaMMUKlXctQQhQtEndTt5Csu11iIA8kUManpvWNMvej0+3zUD4xX6T2hMx0dSBEEhw0j+DYD@vger.kernel.org, AJvYcCXNl4C0zJqZBPd7+nMJ5kZM9nG3S17Kl84Ekv/wRKwBB43/IueslKdXKdmTiEPDkEx6sCtWRzhVtRQctDaMYOs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwogZh8TBahsN851wN2g3XuYMDtm/mr8nXIDOkjX2I6n4X+9rbo
	XmYNzP3bOmu5zWyBI9OIUgVlg/VxixAQSx2go1CPmVGJiTiQdW7TW63O4lXNqFS69CMyl6IGwfq
	WCzTIGjLX7hHfB5M+vpyE8zBUYK4=
X-Google-Smtp-Source: AGHT+IF7a5fnhO6HmzbvVN4wOBrDrBYZiDSOrKcFK0hTzDaUwPKEYM+adhmLfqDLPcU8Xu7YLExlWDIVyVXNXuekEHA=
X-Received: by 2002:a05:6512:3c8a:b0:539:896e:46ce with SMTP id
 2adb3069b0e04-539ac17ebdcmr2881071e87.28.1728236215356; Sun, 06 Oct 2024
 10:36:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240923181846.549877-22-samitolvanen@google.com> <20240923181846.549877-23-samitolvanen@google.com>
In-Reply-To: <20240923181846.549877-23-samitolvanen@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 7 Oct 2024 02:36:19 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQzoJNQ21o3pmozo5c0rLq-ETaAqxSgbiU_gJu7U_mu8g@mail.gmail.com>
Message-ID: <CAK7LNAQzoJNQ21o3pmozo5c0rLq-ETaAqxSgbiU_gJu7U_mu8g@mail.gmail.com>
Subject: Re: [PATCH v3 01/20] scripts: import more list macros
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthew Maurer <mmaurer@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, Asahi Linux <asahi@lists.linux.dev>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 24, 2024 at 3:19=E2=80=AFAM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> Import list_is_first, list_is_last, list_replace, and list_replace_init.
>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>


This one was applied to linux-kbuild.
Thanks.


> ---
>  scripts/include/list.h | 50 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>
> diff --git a/scripts/include/list.h b/scripts/include/list.h
> index fea1e2b79063..8bdcaadca709 100644
> --- a/scripts/include/list.h
> +++ b/scripts/include/list.h
> @@ -127,6 +127,36 @@ static inline void list_del(struct list_head *entry)
>         entry->prev =3D LIST_POISON2;
>  }
>
> +/**
> + * list_replace - replace old entry by new one
> + * @old : the element to be replaced
> + * @new : the new element to insert
> + *
> + * If @old was empty, it will be overwritten.
> + */
> +static inline void list_replace(struct list_head *old,
> +                               struct list_head *new)
> +{
> +       new->next =3D old->next;
> +       new->next->prev =3D new;
> +       new->prev =3D old->prev;
> +       new->prev->next =3D new;
> +}
> +
> +/**
> + * list_replace_init - replace old entry by new one and initialize the o=
ld one
> + * @old : the element to be replaced
> + * @new : the new element to insert
> + *
> + * If @old was empty, it will be overwritten.
> + */
> +static inline void list_replace_init(struct list_head *old,
> +                                    struct list_head *new)
> +{
> +       list_replace(old, new);
> +       INIT_LIST_HEAD(old);
> +}
> +
>  /**
>   * list_move - delete from one list and add as another's head
>   * @list: the entry to move
> @@ -150,6 +180,26 @@ static inline void list_move_tail(struct list_head *=
list,
>         list_add_tail(list, head);
>  }
>
> +/**
> + * list_is_first -- tests whether @list is the first entry in list @head
> + * @list: the entry to test
> + * @head: the head of the list
> + */
> +static inline int list_is_first(const struct list_head *list, const stru=
ct list_head *head)
> +{
> +       return list->prev =3D=3D head;
> +}
> +
> +/**
> + * list_is_last - tests whether @list is the last entry in list @head
> + * @list: the entry to test
> + * @head: the head of the list
> + */
> +static inline int list_is_last(const struct list_head *list, const struc=
t list_head *head)
> +{
> +       return list->next =3D=3D head;
> +}
> +
>  /**
>   * list_is_head - tests whether @list is the list @head
>   * @list: the entry to test
> --
> 2.46.0.792.g87dc391469-goog
>


--=20
Best Regards
Masahiro Yamada

