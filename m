Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBC90130E03
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Jan 2020 08:34:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726612AbgAFHeh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 6 Jan 2020 02:34:37 -0500
Received: from mail-qt1-f202.google.com ([209.85.160.202]:33692 "EHLO
        mail-qt1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726488AbgAFHeh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Jan 2020 02:34:37 -0500
Received: by mail-qt1-f202.google.com with SMTP id l25so33910481qtu.0
        for <linux-kbuild@vger.kernel.org>; Sun, 05 Jan 2020 23:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=xQuut/X/n4tj8+mFTwoLLA+4SmHaEnPrhwV00PJc3JE=;
        b=G2W69+bt7ri9aBBIUO5TrD0dCvZaGADY6sf5X0OO2PtW2ov2MwhsLM8r0NaXWQ2UB+
         kDHIn101OYCbCytSGJhlVuuace7KdkLwG/CSlktcMZrKtIgu/AthjuXKsAuXbQIjS9VU
         F1J0PWyZsAbO793m6K9TF+eTO47fjkoVhBZPKorywrxgZncdzgz5R8mJnqusA/J1Q53X
         tA5cRfw9OAaYSaBXRqH1S7bjnM0Xsk8SZNJ8orjSDpqxKjVzMsdOwmUYvW9eSXYwJcwx
         WseBEa9Bx1+BFWzO6iS5HLBpyTKRi1rUkkllfk9yt90f7SlSbxSpYJt1GyWw2Wf96vTR
         O7gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=xQuut/X/n4tj8+mFTwoLLA+4SmHaEnPrhwV00PJc3JE=;
        b=d5VY02JpTkaxfmwUwJ4SwJIE33nzdXbYWt3tlieHhXolPMx9AZG8yZgn07+60ml3mb
         Rp+io2IgQgEdBS2gUQ7X1g/FqGRgXoMTcgmXPBiYMIrr4tlfkpU3l95UhQAVg1WwVrt4
         LqrUJAASDrBpre2wnVqCh5gnTpN+lUaIJGdZfA4Qpt79YdgrlNNHKqaJ1GqSJY0lBq6S
         rgYXHadn/2RmS/085sZryTBuSwSXK72G0ndpyKOUc9EeRv+GqY0I4/s665sdGxE2SEqp
         rNAxb2kz9Hp30wlvfmzRJBPi72N70wziXarNeGio54Qt1/wAo0V6hLBD24chs38F3itz
         N7fg==
X-Gm-Message-State: APjAAAVSTqTl/qOaLzEsZVwwG2h7C7KFl0BZIRRDoDk54Z7d++LwcWst
        9pjPSZ7bpDJePjAKEaKZhtu+L1NCtQnQ
X-Google-Smtp-Source: APXvYqwZk96azg+wSnBjPpdVcomn4j/TgWjL9PPZ6ewHrda792uhgGbb4+PaOi2lhAuZEybajJl1bYRSiXrG
X-Received: by 2002:ac8:440b:: with SMTP id j11mr75206754qtn.283.1578296075872;
 Sun, 05 Jan 2020 23:34:35 -0800 (PST)
Date:   Sun, 05 Jan 2020 23:34:33 -0800
In-Reply-To: <20200104150238.19834-4-masahiroy@kernel.org>
Message-Id: <xr93imlp6nsm.fsf@gthelen.svl.corp.google.com>
Mime-Version: 1.0
References: <20200104150238.19834-1-masahiroy@kernel.org> <20200104150238.19834-4-masahiroy@kernel.org>
Subject: Re: [PATCH v2 03/13] gen_initramfs_list.sh: fix the tool name in the comment
From:   Greg Thelen <gthelen@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Masahiro Yamada <masahiroy@kernel.org> wrote:

> There is no tool named "gen_initramfs". The correct name is
> "gen_init_cpio".
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Greg Thelen <gthelen@google.com>
