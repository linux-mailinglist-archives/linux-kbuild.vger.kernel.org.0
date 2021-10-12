Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0773842ADAB
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Oct 2021 22:16:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232419AbhJLUSX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 12 Oct 2021 16:18:23 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:34013 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231902AbhJLUSX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Oct 2021 16:18:23 -0400
Received: from leknes.fjasle.eu ([92.116.69.156]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MvsR7-1mqxEn0HId-00suTC; Tue, 12 Oct 2021 22:16:06 +0200
Received: from lillesand.fjasle.eu (unknown [10.10.0.51])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "lillesand.fjasle.eu", Issuer "Fake LE Intermediate X1" (not verified))
        by leknes.fjasle.eu (Postfix) with ESMTPS id B154B3C007;
        Tue, 12 Oct 2021 22:16:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
        t=1634069763; bh=LQDleuZl/HuBtpl53wDXL/ybm9OyRT9GfmM6iM8JNWc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xayWlG+vdfVa/b51CYSxn44cFoU3w6CE7DW9r2TPgHfkL7PuXfcHS3gKtZ9gIz3yA
         m0Oky5smn5vU5LpGqILwKjdQFRQbr2bCps7U0G7oyowJNAxAn0yU/jWbNhS5x9P45e
         7lauwdI+ahF7fpQu7WLki+1gVMlWYGEezsaXRoC0=
Received: by lillesand.fjasle.eu (Postfix, from userid 1000)
        id 1BB621045BD; Tue, 12 Oct 2021 22:16:02 +0200 (CEST)
Date:   Tue, 12 Oct 2021 22:16:01 +0200
From:   Nicolas Schier <nicolas@fjasle.eu>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gen_init_cpio: add static const qualifiers
Message-ID: <YWXtAf2aAYyhCgvw@lillesand.fjasle.eu>
Mail-Followup-To: Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211012025514.448804-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211012025514.448804-1-masahiroy@kernel.org>
X-Operating-System: Debian GNU/Linux bookworm/sid
Jabber-ID: nicolas@jabber.no
X-Provags-ID: V03:K1:Ku+FsTCfat9GTGn2tgaOHAuhW66U27su1DHY6wHGF+GaELZcKEM
 ChpeBWZuOTqZhQX//q09VCI47WotTGvpqsNKdMkrvdQnDsaBiqOHK5+yLK5ELZYt2CUSgsl
 UU/X9xUKPCJKUgt78tLXxQNcD42aWdEoHMUq5ndTUjGVC10gou72YrmWLkGpk3EvZIs3JbJ
 3ukCS+0vKdlRbLvxo1i7A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8jkUQ8zTMAU=:GolrPx098A3UjKRPMdBums
 AHjek80rnliD7MWQuN7/gHMqBM+179Uvr1JHenGN6ZI48ZbkSojD/dmawqrSkaTCnqlgOab9u
 BePovc4Eb1ZOqBRFJ0WdOZMoiYhFoEPlELtqj4eTZV7xV6pxocuraYXCG9mg/AAk9EnsBVs73
 V5LWBROMjl22MRyg1vavePl0bug99PhFVuPipvhAoLnHUsZyR5qtinbutPEMaO5lJvMyrgxeD
 I2WCQ4rVkIX3a4dpygjbNxtbV1IL1BsDOkJGL1t3Uz2zkr2Q6khbrfbTZVK7gK6wcDrFElTyi
 W/61vc/m3DitaVI7purcKiPlEuWqBVkYGJlo+vkv05PctlujWXb7cvyivi76URTMfw+wSFGTH
 cEB8u0H0U5FE8le4nbZCqPtUOEJHovaXtKHULUOtqTZwke4TsiztPQctXdydsMC/kttrIN+v4
 QDN3yVFVqVMbc3ihD7qAMTylV4aVhd+CXTQrgE6lgD/UJ6W2oQpW3+px2w4ObIKRhCBrq8YsC
 WMpMqk9WxEAtx3VDMSGJ+kQSr5TPmohP2JXRiewtWCAo5b+Se1iuBsNQGzXLIIp3fBRW130qZ
 C4pISVsl1pXkQX2kfLcTqQ88484A9YkT/kMVWrugNvevH4Y0egWBx+8aOLmXHjSHXTc5qyehE
 28P7HA6sTTvs9npBSYmkStOF5V3OEdXlTl1zRR+Z7yeM5m0BqjPuC0Y4zlEky4CbYdDM28S8H
 KM9sN2kEeAw8oB0kMJYO4XaBq7QFEQUCjrIKLA==
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On ti. 12. okt. 2021 kl. 11.55 +0000 Masahiro Yamada wrote:
> Add 'const' to constant arrays. I also added missing 'static'.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

> ---
> 
>  usr/gen_init_cpio.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/usr/gen_init_cpio.c b/usr/gen_init_cpio.c
> index 03b21189d58b..bf5b98c6cf8d 100644
> --- a/usr/gen_init_cpio.c
> +++ b/usr/gen_init_cpio.c
> @@ -188,7 +188,7 @@ struct generic_type {
>  	mode_t mode;
>  };
>  
> -static struct generic_type generic_type_table[] = {
> +static const struct generic_type generic_type_table[] = {
>  	[GT_DIR] = {
>  		.type = "dir",
>  		.mode = S_IFDIR
> @@ -491,7 +491,7 @@ static void usage(const char *prog)
>  		prog);
>  }
>  
> -struct file_handler file_handler_table[] = {
> +static const struct file_handler file_handler_table[] = {
>  	{
>  		.type    = "file",
>  		.handler = cpio_mkfile_line,
> -- 
> 2.30.2
> 

-- 
epost|xmpp: nicolas@fjasle.eu          irc://oftc.net/nsc
↳ gpg: 18ed 52db e34f 860e e9fb  c82b 7d97 0932 55a0 ce7f
     -- frykten for herren er opphav til kunnskap --
