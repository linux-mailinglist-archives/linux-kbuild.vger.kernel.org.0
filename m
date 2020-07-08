Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C04AB2192DC
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Jul 2020 23:52:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725964AbgGHVwn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 8 Jul 2020 17:52:43 -0400
Received: from a27-192.smtp-out.us-west-2.amazonses.com ([54.240.27.192]:58014
        "EHLO a27-192.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725903AbgGHVwn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Jul 2020 17:52:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=7jvkchcrhflv7qhbkgrcypyraifp65wy; d=rt.linuxfoundation.org;
        t=1594245162;
        h=Subject:From:Reply-To:In-Reply-To:References:Message-ID:To:CC:Content-Type:Date:MIME-Version:Content-Transfer-Encoding;
        bh=dBdtfGTcvufqjLjvZCv6ZP4wRkmoY1IBUs3FHit4fCo=;
        b=E0TNftXGc8UtXAw5V0bFEYdh22511KljkGbnK2qG/ibfQqUj/IriOcAKYXsFkRAO
        9ecrPSyOnZv1TjmyHkP5Rreie5MXYoc98KJVhIGCX8a7+KebjQj0xi1WZCy2KqdegS0
        wz+nZLoWddZwX5i8Ys5iX8zYoue5gpZAHCBmLLPw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1594245162;
        h=Subject:From:Reply-To:In-Reply-To:References:Message-ID:To:CC:Content-Type:Date:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
        bh=dBdtfGTcvufqjLjvZCv6ZP4wRkmoY1IBUs3FHit4fCo=;
        b=Td5SPYWOHB6ej3mJyT6j6osgVdOiXly1L60arjE737PtmmuOdkdg5gCPuIpiRwCi
        EZ3Z5IrpaaFL9uLDUcE8NmcL9z8pJ/QSkICO8VuMMEFHG4StkfH4xpCba1cVBBBIQF+
        Zt9OvVG363cDPBxgSyW2F2ksPbdEJxzPCH/dIcH8=
Subject: [Kernel.org Helpdesk #93182] [linuxfoundation.org #93182] Re: linux-kbuild missing from lore?
From:   "Hank Leininger via RT" <kernel-helpdesk@rt.linuxfoundation.org>
Reply-To: kernel-helpdesk@rt.linuxfoundation.org
In-Reply-To: <20200708214526.GA1893@ultron.spinoli.org>
References: <RT-Ticket-93182@linuxfoundation>
 <CAKwvOd=i8mLYsSNtJTcZ=RTk76F_mYy9fM9FBtDveFybxyGyiw@mail.gmail.com>
 <CAK7LNARc4L18CP6ZbTheh43VobQZ1s_2Q=4O7oKmTZRLgiTw6Q@mail.gmail.com>
 <f30f6849-9d94-4ba9-f875-9ab8c0700620@infradead.org>
 <CAKwvOdnknZNPuucvy0Kim6xCfyUhmNKXQiERCQcoSMYdo6=6FQ@mail.gmail.com>
 <acc9cbac-982b-e3a0-d1bf-5d3d4ffd9b08@infradead.org>
 <CAKwvOdnNW0JiX1SMUePKCS37Cjfa+rx=SKrcu0jU1qyMNCq0yA@mail.gmail.com>
 <20200708214526.GA1893@ultron.spinoli.org>
Message-ID: <01010173306aa3a2-3ad9d9e2-4cb2-42a7-a0d5-796cdf126db0-000000@us-west-2.amazonses.com>
X-RT-Loop-Prevention: linuxfoundation.org
X-RT-Ticket: linuxfoundation.org #93182
X-Managed-BY: RT 4.4.0 (http://www.bestpractical.com/rt/)
X-RT-Originator: hlein@marc.info
To:     ndesaulniers@google.com
CC:     linux-kbuild@vger.kernel.org, masahiroy@kernel.org,
        michal.lkml@markovi.net, nhuck@google.com, rdunlap@infradead.org,
        sam@ravnborg.org
X-RT-Original-Encoding: utf-8
Content-Type: multipart/mixed; boundary="----------=_1594245161-11505-1688"
Date:   Wed, 8 Jul 2020 21:52:41 +0000
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SES-Outgoing: 2020.07.08-54.240.27.192
Feedback-ID: 1.us-west-2.3ULHQnc20aILdVzjlbQ8UqO1WRWzA1U01b2uFAcT62w=:AmazonSES
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This is a multi-part message in MIME format...

------------=_1594245161-11505-1688
Content-Type: text/plain; charset="utf-8"

On Wed, Jul 08, 2020 at 01:49:18PM -0700, Nick Desaulniers wrote:
> On Wed, Jul 8, 2020 at 1:43 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> >
> > On 7/8/20 11:42 AM, Nick Desaulniers wrote:
> > > On Mon, Mar 16, 2020 at 6:06 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> > >>
> > >> On 3/16/20 5:47 PM, Masahiro Yamada wrote:
> > >>> Hi Nick,
> > >>>
> > >>> On Tue, Mar 17, 2020 at 8:22 AM Nick Desaulniers
> > >>> <ndesaulniers@google.com> wrote:
> > >>>>
> > >>>> Hi Masahiro,
> > >>>> I noticed that linux-kbuild@vger.kernel.org seems to be missing from
> > >>>> https://lore.kernel.org/lists.html.  Is that intentional or
> > >>>> accidental?
[snip]
> > Has anyone thought about trying to get the kbuild archive from
> > marc.info/?l=linux-kbuild ?  or contacted the marc.info admin?
> 
> Clicking "add a list" on
> https://marc.info/
> opens an emailto: link to webguy@marc.info, so adding them here.
> Dear marc.info admin, is exporting a copy of the linux-kbuild mail
> archive something that you can help us with?

Hi! That sounds like it should be doable; we keep .gz backups of all
the lists we're subscribed to. At a quick glance I have them going back
to Jan 2, 2008, I thiiiink uninterrupted. There's probably some spam
that got sent to the list and/or sent to our subscribed address
included.

Can someone please contact me off-thread and we'll work out details of
how to best get them to you?

Thanks,

--

Hank Leininger <hlein@marc.info>
ED0E 3040 4240 1DD9 5B2E  6DEC A60B CB9D 0939 76F7


------------=_1594245161-11505-1688
Content-Type: application/x-rt-original-message
Content-Disposition: inline
Content-Transfer-Encoding: base64
RT-Attachment: 93182/2019561/1688434

RnJvbSBTUlMwPTE4SHk9QVQ9bWFyYy5pbmZvPWhsZWluQGtlcm5lbC5vcmcg
IFdlZCBKdWwgIDggMjE6NTI6MzYgMjAyMApSZXR1cm4tUGF0aDogPFNSUzA9
MThIeT1BVD1tYXJjLmluZm89aGxlaW5Aa2VybmVsLm9yZz4KWC1PcmlnaW5h
bC1Ubzoga2VybmVsLWhlbHBkZXNrQHJ0LmxpbnV4Zm91bmRhdGlvbi5vcmcK
RGVsaXZlcmVkLVRvOiBrZXJuZWwtaGVscGRlc2tAcnQubGludXhmb3VuZGF0
aW9uLm9yZwpSZWNlaXZlZDogZnJvbSBtYWlsLmtlcm5lbC5vcmcgKG1haWwu
a2VybmVsLm9yZyBbMTk4LjE0NS4yOS45OV0pCglieSBhd3MtdXMtd2VzdC0y
LWxmaXQtcnQtMS53ZWIuY29kZWF1cm9yYS5vcmcgKFBvc3RmaXgpIHdpdGgg
RVNNVFAgaWQgQkNFOTFDMDNBRUYKCWZvciA8a2VybmVsLWhlbHBkZXNrQHJ0
LmxpbnV4Zm91bmRhdGlvbi5vcmc+OyBXZWQsICA4IEp1bCAyMDIwIDIxOjUy
OjM2ICswMDAwIChVVEMpClJlY2VpdmVkOiBieSBtYWlsLmtlcm5lbC5vcmcg
KFBvc3RmaXgpCglpZCA3MDkyQjIwNzcyOyBXZWQsICA4IEp1bCAyMDIwIDIx
OjUyOjM2ICswMDAwIChVVEMpCkRlbGl2ZXJlZC1UbzogaGVscGRlc2tAa2Vy
bmVsLm9yZwpYLUdyZXlsaXN0OiBkZWxheWVkIDQxNyBzZWNvbmRzIGJ5IHBv
c3RncmV5LTEuMzQgYXQgbWFpbC5rZXJuZWwub3JnOyBXZWQsIDA4IEp1bCAy
MDIwIDIxOjUyOjM2IFVUQwpETUFSQy1GaWx0ZXI6IE9wZW5ETUFSQyBGaWx0
ZXIgdjEuMy4yIG1haWwua2VybmVsLm9yZyAyNUVEQzIwNzA4CkF1dGhlbnRp
Y2F0aW9uLVJlc3VsdHM6IG1haWwua2VybmVsLm9yZzsgZG1hcmM9bm9uZSAo
cD1ub25lIGRpcz1ub25lKSBoZWFkZXIuZnJvbT1tYXJjLmluZm8KQXV0aGVu
dGljYXRpb24tUmVzdWx0czogbWFpbC5rZXJuZWwub3JnOyBzcGY9bm9uZSBz
bXRwLm1haWxmcm9tPWhsZWluQG1hcmMuaW5mbwpSZWNlaXZlZDogZnJvbSBw
dWtjYWIua29yZWxvZ2ljLmNvbSAodW5rbm93biBbMTM5LjEzOC4xNDguMTMx
XSkKCSh1c2luZyBUTFN2MS4yIHdpdGggY2lwaGVyIEVDREhFLVJTQS1BRVMy
NTYtR0NNLVNIQTM4NCAoMjU2LzI1NiBiaXRzKSkKCShObyBjbGllbnQgY2Vy
dGlmaWNhdGUgcmVxdWVzdGVkKQoJYnkgbWFpbC5rZXJuZWwub3JnIChQb3N0
Zml4KSB3aXRoIEVTTVRQUyBpZCAyNUVEQzIwNzA4OwoJV2VkLCAgOCBKdWwg
MjAyMCAyMTo1MjozNiArMDAwMCAoVVRDKQpSZWNlaXZlZDogZnJvbSBtYWls
Lm1hcmMuaW5mbyAobWFyYzEubWFyYy5pbmZvIFsyMDUuMTM0LjE5MS4xNzJd
KQoJKHVzaW5nIFRMU3YxLjMgd2l0aCBjaXBoZXIgVExTX0FFU18yNTZfR0NN
X1NIQTM4NCAoMjU2LzI1NiBiaXRzKQoJIGtleS1leGNoYW5nZSBYMjU1MTkg
c2VydmVyLXNpZ25hdHVyZSBSU0EtUFNTICgyMDQ4IGJpdHMpIHNlcnZlci1k
aWdlc3QgU0hBMjU2KQoJKENsaWVudCBkaWQgbm90IHByZXNlbnQgYSBjZXJ0
aWZpY2F0ZSkKCWJ5IHB1a2NhYi5rb3JlbG9naWMuY29tIChQb3N0Zml4KSB3
aXRoIEVTTVRQUyBpZCAzMDQ5MzJCMjAwOUU7CglXZWQsICA4IEp1bCAyMDIw
IDE3OjQ1OjM4IC0wNDAwIChFRFQpClJlY2VpdmVkOiBmcm9tIHVsdHJvbi5z
cGlub2xpLm9yZyAodW5rbm93biBbNzEuMzMuMjI2LjYxXSkKCSh1c2luZyBU
TFN2MS4yIHdpdGggY2lwaGVyIEVDREhFLVJTQS1BRVMyNTYtR0NNLVNIQTM4
NCAoMjU2LzI1NiBiaXRzKSkKCShObyBjbGllbnQgY2VydGlmaWNhdGUgcmVx
dWVzdGVkKQoJKEF1dGhlbnRpY2F0ZWQgc2VuZGVyOiBobGVpbikKCWJ5IG1h
aWwubWFyYy5pbmZvIChQb3N0Zml4KSB3aXRoIEVTTVRQU0EgaWQgQ0JERTE5
QzYwMDdGOwoJV2VkLCAgOCBKdWwgMjAyMCAxNzo0NTozMiAtMDQwMCAoRURU
KQpEYXRlOiBXZWQsIDggSnVsIDIwMjAgMTU6NDU6MjYgLTA2MDAKRnJvbTog
SGFuayBMZWluaW5nZXIgPGhsZWluQG1hcmMuaW5mbz4KVG86IE5pY2sgRGVz
YXVsbmllcnMgPG5kZXNhdWxuaWVyc0Bnb29nbGUuY29tPgpDYzogUmFuZHkg
RHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+LCB3ZWJndXlAbWFyYy5p
bmZvLAoJTWFzYWhpcm8gWWFtYWRhIDxtYXNhaGlyb3lAa2VybmVsLm9yZz4s
CglMaW51eCBLYnVpbGQgbWFpbGluZyBsaXN0IDxsaW51eC1rYnVpbGRAdmdl
ci5rZXJuZWwub3JnPiwKCWhlbHBkZXNrQGtlcm5lbC5vcmcsIFNhbSBSYXZu
Ym9yZyA8c2FtQHJhdm5ib3JnLm9yZz4sCglOYXRoYW4gSHVja2xlYmVycnkg
PG5odWNrQGdvb2dsZS5jb20+LAoJTWljaGFsIE1hcmVrIDxtaWNoYWwubGtt
bEBtYXJrb3ZpLm5ldD4KU3ViamVjdDogUmU6IGxpbnV4LWtidWlsZCBtaXNz
aW5nIGZyb20gbG9yZT8KTWVzc2FnZS1JRDogPDIwMjAwNzA4MjE0NTI2LkdB
MTg5M0B1bHRyb24uc3Bpbm9saS5vcmc+ClJlcGx5LVRvOiBIYW5rIExlaW5p
bmdlciA8aGxlaW5AbWFyYy5pbmZvPgpSZWZlcmVuY2VzOiA8Q0FLd3ZPZD1p
OG1MWXNTTnRKVGNaPVJUazc2Rl9tWXk5Zk05RkJ0RHZlRnlieHlHeWl3QG1h
aWwuZ21haWwuY29tPgogPENBSzdMTkFSYzRMMThDUDZaYlRoZWg0M1ZvYlFa
MXNfMlE9NE83b0ttVFpSTGdpVHc2UUBtYWlsLmdtYWlsLmNvbT4KIDxmMzBm
Njg0OS05ZDk0LTRiYTktZjg3NS05YWI4YzA3MDA2MjBAaW5mcmFkZWFkLm9y
Zz4KIDxDQUt3dk9kbmtuWk5QdXVjdnkwS2ltNnhDZnlVaG1OS1hRaUVSQ1Fj
b1NNWWRvNj02RlFAbWFpbC5nbWFpbC5jb20+CiA8YWNjOWNiYWMtOTgyYi1l
M2EwLWQxYmYtNWQzZDRmZmQ5YjA4QGluZnJhZGVhZC5vcmc+CiA8Q0FLd3ZP
ZG5OVzBKaVgxU01VZVBLQ1MzN0NqZmErcng9U0tyY3UwalUxcXlNTkNxMHlB
QG1haWwuZ21haWwuY29tPgpNSU1FLVZlcnNpb246IDEuMApDb250ZW50LVR5
cGU6IG11bHRpcGFydC9zaWduZWQ7IG1pY2FsZz1wZ3Atc2hhMjU2OwoJcHJv
dG9jb2w9ImFwcGxpY2F0aW9uL3BncC1zaWduYXR1cmUiOyBib3VuZGFyeT0i
NlRybmx0U3RYVzRpd21pMCIKQ29udGVudC1EaXNwb3NpdGlvbjogaW5saW5l
CkluLVJlcGx5LVRvOiA8Q0FLd3ZPZG5OVzBKaVgxU01VZVBLQ1MzN0NqZmEr
cng9U0tyY3UwalUxcXlNTkNxMHlBQG1haWwuZ21haWwuY29tPgoKCi0tNlRy
bmx0U3RYVzRpd21pMApDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJz
ZXQ9dXMtYXNjaWkKQ29udGVudC1EaXNwb3NpdGlvbjogaW5saW5lCkNvbnRl
bnQtVHJhbnNmZXItRW5jb2Rpbmc6IHF1b3RlZC1wcmludGFibGUKCk9uIFdl
ZCwgSnVsIDA4LCAyMDIwIGF0IDAxOjQ5OjE4UE0gLTA3MDAsIE5pY2sgRGVz
YXVsbmllcnMgd3JvdGU6Cj4gT24gV2VkLCBKdWwgOCwgMjAyMCBhdCAxOjQz
IFBNIFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPiB3cm90
ZToKPiA+Cj4gPiBPbiA3LzgvMjAgMTE6NDIgQU0sIE5pY2sgRGVzYXVsbmll
cnMgd3JvdGU6Cj4gPiA+IE9uIE1vbiwgTWFyIDE2LCAyMDIwIGF0IDY6MDYg
UE0gUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+ID0Kd3Jv
dGU6Cj4gPiA+Pgo+ID4gPj4gT24gMy8xNi8yMCA1OjQ3IFBNLCBNYXNhaGly
byBZYW1hZGEgd3JvdGU6Cj4gPiA+Pj4gSGkgTmljaywKPiA+ID4+Pgo+ID4g
Pj4+IE9uIFR1ZSwgTWFyIDE3LCAyMDIwIGF0IDg6MjIgQU0gTmljayBEZXNh
dWxuaWVycwo+ID4gPj4+IDxuZGVzYXVsbmllcnNAZ29vZ2xlLmNvbT4gd3Jv
dGU6Cj4gPiA+Pj4+Cj4gPiA+Pj4+IEhpIE1hc2FoaXJvLAo+ID4gPj4+PiBJ
IG5vdGljZWQgdGhhdCBsaW51eC1rYnVpbGRAdmdlci5rZXJuZWwub3JnIHNl
ZW1zIHRvIGJlIG1pc3NpbmcgZnI9Cm9tCj4gPiA+Pj4+IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xpc3RzLmh0bWwuICBJcyB0aGF0IGludGVudGlvbmFs
IG9yCj4gPiA+Pj4+IGFjY2lkZW50YWw/CltzbmlwXQo+ID4gSGFzIGFueW9u
ZSB0aG91Z2h0IGFib3V0IHRyeWluZyB0byBnZXQgdGhlIGtidWlsZCBhcmNo
aXZlIGZyb20KPiA+IG1hcmMuaW5mby8/bD0zRGxpbnV4LWtidWlsZCA/ICBv
ciBjb250YWN0ZWQgdGhlIG1hcmMuaW5mbyBhZG1pbj8KPj0yMAo+IENsaWNr
aW5nICJhZGQgYSBsaXN0IiBvbgo+IGh0dHBzOi8vbWFyYy5pbmZvLwo+IG9w
ZW5zIGFuIGVtYWlsdG86IGxpbmsgdG8gd2ViZ3V5QG1hcmMuaW5mbywgc28g
YWRkaW5nIHRoZW0gaGVyZS4KPiBEZWFyIG1hcmMuaW5mbyBhZG1pbiwgaXMg
ZXhwb3J0aW5nIGEgY29weSBvZiB0aGUgbGludXgta2J1aWxkIG1haWwKPiBh
cmNoaXZlIHNvbWV0aGluZyB0aGF0IHlvdSBjYW4gaGVscCB1cyB3aXRoPwoK
SGkhIFRoYXQgc291bmRzIGxpa2UgaXQgc2hvdWxkIGJlIGRvYWJsZTsgd2Ug
a2VlcCAuZ3ogYmFja3VwcyBvZiBhbGwKdGhlIGxpc3RzIHdlJ3JlIHN1YnNj
cmliZWQgdG8uIEF0IGEgcXVpY2sgZ2xhbmNlIEkgaGF2ZSB0aGVtIGdvaW5n
IGJhY2sKdG8gSmFuIDIsIDIwMDgsIEkgdGhpaWlpbmsgdW5pbnRlcnJ1cHRl
ZC4gVGhlcmUncyBwcm9iYWJseSBzb21lIHNwYW0KdGhhdCBnb3Qgc2VudCB0
byB0aGUgbGlzdCBhbmQvb3Igc2VudCB0byBvdXIgc3Vic2NyaWJlZCBhZGRy
ZXNzCmluY2x1ZGVkLgoKQ2FuIHNvbWVvbmUgcGxlYXNlIGNvbnRhY3QgbWUg
b2ZmLXRocmVhZCBhbmQgd2UnbGwgd29yayBvdXQgZGV0YWlscyBvZgpob3cg
dG8gYmVzdCBnZXQgdGhlbSB0byB5b3U/CgpUaGFua3MsCgotLQoKSGFuayBM
ZWluaW5nZXIgPGhsZWluQG1hcmMuaW5mbz4KRUQwRSAzMDQwIDQyNDAgMURE
OSA1QjJFICA2REVDIEE2MEIgQ0I5RCAwOTM5IDc2RjcKCi0tNlRybmx0U3RY
VzRpd21pMApDb250ZW50LVR5cGU6IGFwcGxpY2F0aW9uL3BncC1zaWduYXR1
cmU7IG5hbWU9InNpZ25hdHVyZS5hc2MiCkNvbnRlbnQtRGVzY3JpcHRpb246
IERpZ2l0YWwgc2lnbmF0dXJlCgotLS0tLUJFR0lOIFBHUCBTSUdOQVRVUkUt
LS0tLQoKaVFFekJBRUJDQUFkRmlFRTdRNHdRRUpBSGRsYkxtM3NwZ3ZMblFr
NWR2Y0ZBbDhHUG5ZQUNna1FwZ3ZMblFrNQpkdmQ4NWdmL1Y3cTA5WTJxbXBT
V0FSRDlrQWkwNVV1S2Y0NXBVOHBVZk5ndFQvYnpqc283M3dYZkh0bEVDN2xW
CmY3Z3ZIdXNFaElvMTlDSFFGRlA0a2NRdVdIL1gvbzhkYXJWUWJkRzNabUNv
aDR1ZDNOcnk1akpaenorRVlVRWIKY0tRSVpWQUhtcXNVQVllaUVUYkliREVM
TXB4SGFrVTJGR2RrMUtsemx2akh5a1Mrcmxwb1RpNW85aFdjeXVDRQphZTdT
RExtbldtMG5WR1JnUVVENnJHRXhLbHVhZ2hjV3gxb3RaeGNnaUhPY09yd0kw
d0x4RXRRTHpKcWFFMlJtCk82VWJpa25KNXJjakhZU2FFTU1UWWxKK3BrYXR6
dXJSSzlMcUJKTWE2TTRjWXpNNThTVnBvRFRiUWdTZnllVnAKdDBqYldCWEpz
Q1UzZlZKYmtDTTgwSExwVVBVUllRPT0KPTVDbFEKLS0tLS1FTkQgUEdQIFNJ
R05BVFVSRS0tLS0tCgotLTZUcm5sdFN0WFc0aXdtaTAtLQo=

------------=_1594245161-11505-1688--
