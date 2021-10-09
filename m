Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D363427A61
	for <lists+linux-kbuild@lfdr.de>; Sat,  9 Oct 2021 15:06:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233117AbhJINIU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 9 Oct 2021 09:08:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233022AbhJINIT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 9 Oct 2021 09:08:19 -0400
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:191:4433::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77EB3C061570
        for <linux-kbuild@vger.kernel.org>; Sat,  9 Oct 2021 06:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
        Resent-Cc:Resent-Message-ID; bh=ZIQGeXe+mSAYhlxYXnG6BdcZumr21T72xdNsenB+ZKY=;
        t=1633784782; x=1634994382; b=TcdNuULkZeQnmpMpPGhwJmnERrCc1HlG+IgQOTLFzJiyL7r
        mKgrJHnHFRyGnCeEzafTJZLvcwy00a08LNUDm0DP9uXmSNagvNBZFG1+iAgK3OeAIEvcsMe041YGw
        4MprF2rrhMNQjczBMC10QlIWX9F3a75fsN1VlIhI+/fS3KQTRbBEip5EoHxC5ZzbiR0WkHdvueo/R
        7gT7pAZdckTl0eTvMMDUyJxdQckkrICk/GgXmmMssZ40Lwcq8l8vDdeup1sxcIH7rQhnZ1uAlL8Cg
        INNOqJF2h989GLVpg9xPpf4fvhxMBu51dOVtiiOpQDGhsZPib5eNlfCdJ2tnAAgw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
        (Exim 4.95)
        (envelope-from <johannes@sipsolutions.net>)
        id 1mZC3A-00Hahd-AI;
        Sat, 09 Oct 2021 15:06:04 +0200
Date:   Sat, 09 Oct 2021 15:06:01 +0200
From:   Johannes Berg <johannes@sipsolutions.net>
To:     Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        David Gow <davidgow@google.com>
CC:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org, Jeff Dike <jdike@addtoit.com>,
        Richard Weinberger <richard@nod.at>,
        linux-um <linux-um@lists.infradead.org>, x86@kernel.org
Subject: Re: [PATCH] um: Add missing "FORCE" target when using if_changed
In-Reply-To: <f0ead035-f05b-73fb-1fd4-48c1eff8bc92@cambridgegreys.com>
References: <20211008215133.9371-1-rdunlap@infradead.org> <CABVgOS=QVysVtN5seB5hp7hHAw5P0yuOaA3rgkRtEyiJu-1H6Q@mail.gmail.com> <05939461-793d-2266-8752-1b593bab8eec@infradead.org> <f0ead035-f05b-73fb-1fd4-48c1eff8bc92@cambridgegreys.com>
Message-ID: <5B27741E-71A5-41CF-912C-D299248691F7@sipsolutions.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-malware-bazaar: not-scanned
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On 9 October 2021 07:36:36 CEST, Anton Ivanov <anton=2Eivanov@cambridgegre=
ys=2Ecom> wrote:

>The patch by Johannes is not in the pending list in patchwork, so it=20
>looks like Richard has processed it and it will be in the next pull reque=
st=2E

I think it's still open: https://patchwork=2Eozlabs=2Eorg/project/linux-um=
/patch/20210928115146=2E277bec2328bb=2EIf70926505d16d6c6a229002eb6d3f6838b5=
46175@changeid/

johannes=20
--=20
Sent from my phone=2E 
