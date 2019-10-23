Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32F11E11B4
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2019 07:33:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725852AbfJWFd6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 23 Oct 2019 01:33:58 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:51698 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725789AbfJWFd6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 23 Oct 2019 01:33:58 -0400
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id x9N5XsRc011253
        for <linux-kbuild@vger.kernel.org>; Wed, 23 Oct 2019 14:33:54 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x9N5XsRc011253
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1571808834;
        bh=lzRvfLE6WqFvDc5PdvxfimbsGJfOUEKLgagqAtd+TmM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=N0AcvwbW5R1dOUwevlbF1NccziHWz1+oTeeAbQVldyBXWxJ97kwo599KoK3g4kU5B
         SOIK0UlR4yqsRppH4MglvNc56fAqaObRYycbpWKUDaHt/4BPJUJRj+SN/Ja9tSymLe
         MPRhSz6j0ZCoyu1z9Y0qrsCB/Me+sP2RD16RXjAfdLKK2jr18T09/St+GjeoSgLhda
         K9sigL5EU07QGokhgaCRP4ngIH8KQGEZ/nQ+WY+i97RV6lInDJL6fYrcPWYapywP+q
         N3zrD8+lr67vBZlB8oq+W5uNch0n8m22khxyi0b8nMpSbOcgFpmQVl+RpJLa2+uzR9
         Rm1jC/4Fyg8Ig==
X-Nifty-SrcIP: [209.85.222.52]
Received: by mail-ua1-f52.google.com with SMTP id m21so5636293ual.13
        for <linux-kbuild@vger.kernel.org>; Tue, 22 Oct 2019 22:33:54 -0700 (PDT)
X-Gm-Message-State: APjAAAXOmBZODfVbSynPNV6rMhyaWTabZEPAK0lOcgo8FJnJVzXCdW7k
        EnX9nFkKXmbDoVO/knGInQgn9IqcBcplS9yWxeE=
X-Google-Smtp-Source: APXvYqy4FIM5mdfaYNWmmVeyXOvmqiEzDUC7GBKpQnyN0fCMszPhyqrYWW5K11N/MjFH0jFfb785/hVClapRRsNmCl4=
X-Received: by 2002:ab0:30a1:: with SMTP id b1mr3748702uam.40.1571808833368;
 Tue, 22 Oct 2019 22:33:53 -0700 (PDT)
MIME-Version: 1.0
References: <20191003031312.157994411@gmail.com> <20191003031312.313485229@gmail.com>
In-Reply-To: <20191003031312.313485229@gmail.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Wed, 23 Oct 2019 14:33:17 +0900
X-Gmail-Original-Message-ID: <CAK7LNAToNaODf_9J5mxz3NnLDGYbDJDP_2Jc3p_mC6bVMaeLMg@mail.gmail.com>
Message-ID: <CAK7LNAToNaODf_9J5mxz3NnLDGYbDJDP_2Jc3p_mC6bVMaeLMg@mail.gmail.com>
Subject: Re: [PATCH 2/4] scripts: namespace.pl: add some x86 object files to nmexception
To:     rd.dunlab@gmail.com
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Oct 3, 2019 at 12:18 PM <rd.dunlab@gmail.com> wrote:


You can grow %nmexception until
you no longer see "No nm data for ..." messages,
but is this maintainable?

I think it is more realistic to
delete the printf "No nm data for $fullname\n" line.



-- 
Best Regards
Masahiro Yamada
