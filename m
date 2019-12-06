Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5960D115822
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Dec 2019 21:12:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726330AbfLFUMH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 6 Dec 2019 15:12:07 -0500
Received: from mail-ot1-f50.google.com ([209.85.210.50]:44840 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726359AbfLFUMH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Dec 2019 15:12:07 -0500
Received: by mail-ot1-f50.google.com with SMTP id x3so6840890oto.11
        for <linux-kbuild@vger.kernel.org>; Fri, 06 Dec 2019 12:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=bfS18BRqPrx2mb+NiLJhVtQIwRro5nX4k3IuxiLh0sI=;
        b=RBUm9plsgj8+nZmhKbo4ptcJ4pMBki50nditc4ivdnjya3PnRW/21TKIEPsY+cFf5G
         AYBtrVS/ACoTunimLKyo63RIf3hvS/x4PWkQX8mA4qnMLX+fHQs4cPohu76ygN53Zpkj
         N16vOt15mRC+UaLTHMOotaA6DmH48KEAtKflNS+ix3xHiNuNjGNtTH1014LPWXrAjKy1
         kqIzb4B7LiZmlakjy/vrRTOE9yvMFtP76S0lJa38QHqJs6os/Ta8U569BAhg/m87s8IA
         Cbo8goN2nm81MOcYpITVCsG2wXlBA/sBEOg18JQ0f2X2L7C+NiBu3dmfCq36hm2RGqBB
         ruKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=bfS18BRqPrx2mb+NiLJhVtQIwRro5nX4k3IuxiLh0sI=;
        b=NDFTExmrXMFt7p+ixzrJQ40aKNbJ5b1hpnUgQ5MZafLeEZxgBVMTXyLdE+R4ZgHWyO
         t1SMAwZfXbgrWhNHRgSoqkXch/v6aXQ485mvmIobw843kbBCKEljqztgs8++OObHX1V6
         Y9jwVHTNORLy7/L1SpB6fjrNz09mz6JmqNy15K7OjSwxmcAUDXFPh6WfINEb/cjitj4+
         P1WvHfWD7QEBEToCPD9kfGS2zJ5/ucTXbjgXP46zMj8GFInoIpVxpeKQA+Q5XZSUjZ7D
         2+dm5rZANaMhpKhkxEYD6xlusx+gY4XG7eAjR6a+Fa+tJ15ZLvoxHGjWSGzOelPynF+1
         aagw==
X-Gm-Message-State: APjAAAVHSj6Rx0HlggN+1Wsune5S+NYptq6gjdZ4cbM1prxpuD1CO/ML
        Uox6sh7yLVdwAF6MWUtRxkaS4TzQjB0rM8jkXvizwI4C
X-Google-Smtp-Source: APXvYqwCGw1X1mPm1L6+esc+JcpmAOUE5M2qoIGR4Mf2vuzFHDso5tuvS6DuBcrTb93PZyYUIm5gwj8CR+kJAnXRzME=
X-Received: by 2002:a05:6830:10a:: with SMTP id i10mr11990603otp.365.1575663126627;
 Fri, 06 Dec 2019 12:12:06 -0800 (PST)
MIME-Version: 1.0
From:   Martin Galvan <omgalvan.86@gmail.com>
Date:   Fri, 6 Dec 2019 17:11:55 -0300
Message-ID: <CAN19L9G-mFN-MTmw0FS3ZX4d1MjeoL2U+s-Fk7Qw9UYWn5Q1YA@mail.gmail.com>
Subject: Some header files being ignored when calculating srcversion
To:     linux-kbuild@vger.kernel.org, michal.lkml@markovi.net,
        yamada.masahiro@socionext.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi all,

I'm working on a kernel module and noticed that sometimes my changes
to certain header files don't affect the module's srcversion hash.
This matters because tools like dkms will refuse to upgrade a module
if the new hash is the same as the one currently installed.

The files being ignored are those that are not (however indirectly)
included by a .c placed in the same directory. In my case, I have a
header which is included by several .c files placed in other
directories; changes to this header won't affect the final srcversion
hash.

The cause of this seems to be this check in sumversion.c:

/* Check if this file is in same dir as objfile */
if ((strstr(line, dir)+strlen(dir)-1) == strrchr(line, '/')) {
    if (!parse_file(line, md)) {
        warn("could not open %s: %s\n",
             line, strerror(errno));
        goto out_file;
    }

}

I'm not sure what's the rationale behind this check, not whether this
behavior is documented anywhere.
