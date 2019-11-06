Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E339F0E63
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Nov 2019 06:30:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725883AbfKFFam (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 6 Nov 2019 00:30:42 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:39267 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725616AbfKFFam (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 Nov 2019 00:30:42 -0500
Received: by mail-io1-f67.google.com with SMTP id k1so13792158ioj.6;
        Tue, 05 Nov 2019 21:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+fH1t0Eq4b/SHUIVadznQK+VU9FRk8QojvCrEtj9mF8=;
        b=ZSS3EEcB2IzDDPnzPVHx84yJB9gBEj7wDWlZPAh8UZThEQ2yGnINh3gk8zSc1YE2wb
         cJVtv2id4rtGyocb++HadZ+qIll26xTnOnfUHGz50HmzHRpIS3o8HPtLqAJwNm86yrwV
         zyWjdrWlJFfZL90Ekt19TsQrf93SN4/SDxQmnqqSui7fqIIpdPWLvvBtJ30mvsEJjA8k
         cXf1oYUXQvTd2eNvfRlhJjIkPEj8vXCMtmpnhcy/MoyB2cibC81rxbSnOeDAYDEMSlQD
         6ji9XJ5EQgMiZf8NbqlagWL2Eoz3nxx3ikhHvJrI5Nowwr4o2vm4JZ0POZf9Yz060+VL
         SODw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+fH1t0Eq4b/SHUIVadznQK+VU9FRk8QojvCrEtj9mF8=;
        b=EPvKXhwCZGHWzvGVqAAiS01oxFelnW986kGMWM0Z7HOoOuxjXhf6HhT1nNF2R8waJB
         FshDqgDyHHLRZ/8zjCaqO4QKe1jSkGfVgc2cEz/lktmdZ2s1p/gj8MFfSCH9qzesLxWl
         XtUTDSVG1TYqiAYK/QWf1gFt6xBoXrLFf/Zard5noQRsifiHVKbDo/tGTvzXY+Wd7Kz+
         KYa1XtPc4Srn2NRiE2JqgUijiE1Hf20CHjmcHkqSP4hH4ifgxa0DWa/IJZU0w8erOpYG
         yUrUdUXkmcmm8t+ekjQGMaqIPbhZVWUCY99ufcpPPfTo9PU1oSLeJ+J3wQA39QK5jjTy
         4ZXw==
X-Gm-Message-State: APjAAAXVzQevo1Qx5onLP5/sChI45nuX9OhkJjGteIUhXpirKdipeboZ
        as2Wcyo3KiE9zwro7fhidz2rNBWW9iNXOpkvZWM=
X-Google-Smtp-Source: APXvYqxoI0HwBWl1tgdjqQfl4a23TXLa96lD9u4dd1qc9E5GumlerFW7jqB5c9/tapG2zzM4xkS5G8w7jfW9MLgj95g=
X-Received: by 2002:a6b:908a:: with SMTP id s132mr32238843iod.118.1573018239753;
 Tue, 05 Nov 2019 21:30:39 -0800 (PST)
MIME-Version: 1.0
References: <20191106033610.29841-1-unixbhaskar@gmail.com>
In-Reply-To: <20191106033610.29841-1-unixbhaskar@gmail.com>
From:   Alexander Kapshuk <alexander.kapshuk@gmail.com>
Date:   Wed, 6 Nov 2019 07:30:03 +0200
Message-ID: <CAJ1xhMXXT9HaZFB2QjB0NCQgc9q6BCnN64Ock1n0Row=jh6aww@mail.gmail.com>
Subject: [PATCH]scripts:ver_linux:Added Bison and Flex to the checklist
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Nov 6, 2019 at 5:36 AM Bhaskar Chowdhury <unixbhaskar@gmail.com> wrote:
>
> As Masahiro pointed out ,only add Bison and Flex to the checklist.
>
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
>  scripts/ver_linux | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/scripts/ver_linux b/scripts/ver_linux
> index 810e608baa24..85005d6b7f10 100755
> --- a/scripts/ver_linux
> +++ b/scripts/ver_linux
> @@ -32,6 +32,8 @@ BEGIN {
>         printversion("PPP", version("pppd --version"))
>         printversion("Isdn4k-utils", version("isdnctrl"))
>         printversion("Nfs-utils", version("showmount --version"))
> +       printversion("Bison", version("bison --version"))
> +       printversion("Flex", version("flex --version"))
>
>         while (getline <"/proc/self/maps" > 0) {
>                 if (/libc.*\.so$/) {
> --
> 2.23.0
>

Acked-by: Alexander Kapshuk <alexander.kapshuk@gmail.com>
