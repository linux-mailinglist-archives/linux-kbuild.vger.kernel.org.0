Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE055783A5
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jul 2019 05:29:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbfG2D3w (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 28 Jul 2019 23:29:52 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:51983 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726343AbfG2D3w (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Jul 2019 23:29:52 -0400
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id x6T3TmJG026343;
        Mon, 29 Jul 2019 12:29:48 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com x6T3TmJG026343
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1564370988;
        bh=gkNAHjCczRsXqca9Q02PCJev39A+w7fs7vtgMWfTnVQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=IVO7KIIMzR3PuLfW2sk/eMGLaMmtrPOAcgzlkWtxFd1RN6B8lXTwci4SJdU/tyD5m
         k3hdhq3wyTAnwUr0nQTlMoyPz6SgCp6QkDFt1+54k3myvjhCL89IdCmXNKXxtLwzUM
         BzzJ3KvY3DgI1NW/A6WUL2QEScxwPPgnmUcRMId4cKM9ain2ctczQSFMnBJHe3B7NR
         A8a0SEr0AG2MJvA/4kkyVulp0+eOfY4e5yRPRB5tIT+XDhgy93sizxMr8C/QDfxchD
         C6ZtVHPU8szdxhFHDvnWLRhQs1C7ne5x9WeqljOtiEzKoj9m/REBvLm/1Hpk91hNJs
         FSvijY5vb+sHg==
X-Nifty-SrcIP: [209.85.217.53]
Received: by mail-vs1-f53.google.com with SMTP id v6so39873455vsq.4;
        Sun, 28 Jul 2019 20:29:48 -0700 (PDT)
X-Gm-Message-State: APjAAAWL3XYGKXsk0dRBiE44D9MfEC0PzW9ObMShBwINEbwME5Sh9Va7
        eVKHleSZOn0qP7NWipJ6mkH+jRQYhrajUfaR+b4=
X-Google-Smtp-Source: APXvYqwJ2InMcZT+uS0/jkiI9sAk8YpdCcOgKwFnQ7S4KMKoZWn8ifksFgimLBMVKGniMnfdTHxoemdxLr3HPnzi108=
X-Received: by 2002:a67:cd1a:: with SMTP id u26mr66121186vsl.155.1564370987596;
 Sun, 28 Jul 2019 20:29:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190714152817.24693-1-efremov@linux.com> <20190728100906.18847-1-efremov@linux.com>
In-Reply-To: <20190728100906.18847-1-efremov@linux.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Mon, 29 Jul 2019 12:29:11 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR9Gzeh6s2QGRF55ORCt1MMSit_cagx-+Ooor_sRC1U8w@mail.gmail.com>
Message-ID: <CAK7LNAR9Gzeh6s2QGRF55ORCt1MMSit_cagx-+Ooor_sRC1U8w@mail.gmail.com>
Subject: Re: [PATCH] modpost: check for static EXPORT_SYMBOL* functions
To:     Denis Efremov <efremov@linux.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Jul 28, 2019 at 7:09 PM Denis Efremov <efremov@linux.com> wrote:
>
> This patch adds a check to warn about static EXPORT_SYMBOL* functions
> during the modpost. In most of the cases, a static symbol marked for
> exporting is an odd combination that should be fixed either by deleting
> the exporting mark or by removing the static attribute and adding the
> appropriate declaration to headers.
>
> This check could help to detect the following problems:
> 1. 550113d4e9f5 ("i2c: add newly exported functions to the header, too")
> 2. 54638c6eaf44 ("net: phy: make exported variables non-static")
> 3. 98ef2046f28b ("mm: remove the exporting of totalram_pages")
> 4. 73df167c819e ("s390/zcrypt: remove the exporting of ap_query_configuration")
> 5. a57caf8c527f ("sunrpc/cache: remove the exporting of cache_seq_next")
> 6. e4e4730698c9 ("crypto: skcipher - remove the exporting of skcipher_walk_next")
> 7. 14b4c48bb1ce ("gve: Remove the exporting of gve_probe")
> 8. 9b79ee9773a8 ("scsi: libsas: remove the exporting of sas_wait_eh")
> 9. ...
>
> Build time impact, allmodconfig, Dell XPS 15 9570 (measurements 3x):
> $ make mrproper; make allmodconfig; time make -j12; \
>   git checkout HEAD~1; \
>   make mrproper; make allmodconfig; time make -j12
> 1.
>    (with patch) 17635,94s user 1895,54s system 1085% cpu 29:59,22 total
>    (w/o  patch) 17275,42s user 1803,87s system 1112% cpu 28:35,66 total
> 2.
>    (with patch) 17369,51s user 1763,28s system 1111% cpu 28:41,47 total
>    (w/o  patch) 16880,50s user 1670,93s system 1113% cpu 27:46,56 total
> 3.
>    (with patch) 17937,88s user 1842,53s system 1109% cpu 29:42,26 total
>    (w/o  patch) 17267,55s user 1725,09s system 1111% cpu 28:28,17 total
>
> Thus, the current implementation adds approx. 1 min for allmodconfig.
>
> Acked-by: Emil Velikov <emil.l.velikov@gmail.com>
> Signed-off-by: Denis Efremov <efremov@linux.com>
> ---
>  scripts/mod/modpost.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>

>
> @@ -2425,6 +2443,7 @@ int main(int argc, char **argv)
>         char *dump_write = NULL, *files_source = NULL;
>         int opt;
>         int err;
> +       size_t n;

Sorry, I missed to ask this in the previous version.

If there is not a particular reason,
may I ask you to use 'int' instead of 'size_t' here?

SYMBOL_HASH_SIZE (= 1024) is small enough, and
it will keep consistency with
the write_dump() function in this file.

If it is tedious to send a new version,
may I fix-up 'size_t' -> 'int' ?

Thanks.


>         struct ext_sym_list *extsym_iter;
>         struct ext_sym_list *extsym_start = NULL;
>
> @@ -2520,6 +2539,19 @@ int main(int argc, char **argv)
>         if (sec_mismatch_count && sec_mismatch_fatal)
>                 fatal("modpost: Section mismatches detected.\n"
>                       "Set CONFIG_SECTION_MISMATCH_WARN_ONLY=y to allow them.\n");
> +       for (n = 0; n < SYMBOL_HASH_SIZE; n++) {
> +               struct symbol *s = symbolhash[n];
> +
> +               while (s) {
> +                       if (s->is_static)
> +                               warn("\"%s\" [%s] is the static %s\n",
> +                                    s->name, s->module->name,
> +                                    export_str(s->export));
> +
> +                       s = s->next;
> +               }
> +       }
> +
>         free(buf.p);
>
>         return err;
> --
> 2.21.0
>


-- 
Best Regards
Masahiro Yamada
