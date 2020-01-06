Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AC1E130E31
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Jan 2020 08:51:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725446AbgAFHvw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 6 Jan 2020 02:51:52 -0500
Received: from mail-pg1-f201.google.com ([209.85.215.201]:51221 "EHLO
        mail-pg1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbgAFHvw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Jan 2020 02:51:52 -0500
Received: by mail-pg1-f201.google.com with SMTP id g20so21571242pgb.18
        for <linux-kbuild@vger.kernel.org>; Sun, 05 Jan 2020 23:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=qas2eq1ihBigEPLC5lEK4tlkBkvo0M4yUxxYSt69jQM=;
        b=Qiy+Yf7yEHo892zN2/olTIIWe0NbHumBXuD3J/GB6wv/bmep/Kc6t0sOisPCWJGIeU
         URm44MY5fEv/c0ewhGjIRPUw6744OBA7XVlJBlS0mzQk45YyvdZJ9+VWCmPH66zEp/kw
         LkAV8GCdS+5JdjIWqME3TGVJEJIsSVacEGhOEIh0fThsLQODTzPo8IxU/z0xH5897mmI
         EIAbs1rAil0rLZJmrTfCuC6xMUErkZYOl/KOqtozXDOLvRtdJ6ABbNSHKCQiFKD3xrT0
         XMN6IuaIkND8zo0WvvZJYIi9jAyZeTIyykLbQk1N4+bHxhYl0UovZTOrC6dsdnNVwAIw
         9bBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=qas2eq1ihBigEPLC5lEK4tlkBkvo0M4yUxxYSt69jQM=;
        b=FHiy0KiCufhGa7JsCXbeiwkYZ4U1sbG447m7ARzB3nr3d9AYrtAESFR+fFQiQedad0
         pqzu3Ky+o81Ga6XHIBCZFmNTURNUSKEnm9TQAIIGs8+HxoyQU2Vxkj4OFieeYKziBZWX
         bTRbOYp2+Y+pr6D6N5XWPicvrCIRCDcUWTJiE3WAPBcUtd3iYoMfQi4ZWtQnkHMX7+02
         MQTBiO+SOwWcKmLvetUt8GgeF/HI7qOUdJy7TXEIx9JtgUqBA9Mg8cQdDM3atYp/Ntek
         PQsNQnX3UWOMrjISl9UMa0+WaB1C9TRpk/CzY9EiTFw0zHdNTevcIfeXNSk5GG0uTxkY
         mfxA==
X-Gm-Message-State: APjAAAW/IDartM2vNeyfoMzhyo2YQbLRxAXSUHQvI6gp7vNu64XBOlsO
        dTu712i/bVef2yI0u5Zb+yKfiyS2R/M+
X-Google-Smtp-Source: APXvYqyVgMALN7tkwXRbRHotd5HIacbmp4O3cPGx0HtwE/C/jnAb9BAuCOEwT6wxFYR+t5QjsU0gRLD4c/dj
X-Received: by 2002:a63:4282:: with SMTP id p124mr106018455pga.155.1578297111170;
 Sun, 05 Jan 2020 23:51:51 -0800 (PST)
Date:   Sun, 05 Jan 2020 23:51:48 -0800
In-Reply-To: <20200104150238.19834-9-masahiroy@kernel.org>
Message-Id: <xr93a7716mzv.fsf@gthelen.svl.corp.google.com>
Mime-Version: 1.0
References: <20200104150238.19834-1-masahiroy@kernel.org> <20200104150238.19834-9-masahiroy@kernel.org>
Subject: Re: [PATCH v2 08/13] initramfs: specify $(src)/gen_initramfs.sh as a
 prerequisite in Makefile
From:   Greg Thelen <gthelen@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Masahiro Yamada <masahiroy@kernel.org> wrote:

> Specify the dependency directly in the Makefile.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Greg Thelen <gthelen@google.com>
